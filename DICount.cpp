//===- Hello.cpp - Example code from "Writing an LLVM Pass" ---------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements two versions of the LLVM "obtain dynamic basic block
// length " pass described
// in docs/WritingAnLLVMPass.html
//
//===----------------------------------------------------------------------===//

#define DEBUG_TYPE "di_count"
#include "llvm/ADT/Statistic.h"
#include "llvm/IR/Function.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Support/InstIterator.h"

#include <string>
#include <map>
#include <set>
#include <list>
#include <vector>

using namespace llvm;


namespace{

    /****** analysis pass ********/
    struct di_count : public ModulePass{
        static char ID;
        Function *hook;

        di_count() : ModulePass(ID) {}

        virtual bool runOnModule(Module &M)
        {
            Constant *hookFunc;
            hookFunc = M.getOrInsertFunction("profileCount", Type::getVoidTy(M.getContext()), Type::getInt64Ty(M.getContext()), NULL);
            hook = cast<Function>(hookFunc);
	    
            for(Module::iterator F = M.begin(), E = M.end(); F!= E; ++F)
            {
                for(Function::iterator BB = F->begin(), E = F->end(); BB != E; ++BB)
                {
                    for(BasicBlock::iterator BI = BB->begin(), BE = BB->end(); BI != BE; ++BI)
                    {
                        long llfiIndex = di_count::getLLFIIndexofInst(BI);

                        int opcode = BI->getOpcode();
                        if(opcode != 48)
                        {   
                            std::vector<Value*> args(1);
                            args[0] = ConstantInt::get(Type::getInt64Ty(M.getContext()), llfiIndex);
                            CallInst* profileCount = CallInst::Create(hook, args, "");
                            BB->getInstList().insert(BI, profileCount);
                        }
                    }
                }
            }
            
            // Instrument printer() when program exits.
            di_count::insertDumpFunction(M);
            
            return false;
        }

        long getLLFIIndexofInst(Instruction *inst) {
			MDNode *mdnode = inst->getMetadata("llfi_index");
			if (mdnode) {
				ConstantInt *cns_index = dyn_cast<ConstantInt>(mdnode->getOperand(0));
				return cns_index->getSExtValue();
			}
			return 0;
		}

        void insertDumpFunction(Module &M)
        {
            std::set<Instruction*> exitinsts;
            Constant* hookFunc;
            Function* hook;
            hookFunc = M.getOrInsertFunction("dumpResult", Type::getVoidTy(M.getContext()), NULL);
            hook = cast<Function>(hookFunc);

            for (Module::iterator m_it = M.begin(); m_it != M.end(); ++m_it) 
            {
                if (!m_it->isDeclaration()) 
                {
                    //m_it is a function  
                    for (inst_iterator f_it = inst_begin(m_it); f_it != inst_end(m_it); ++f_it)
                    {
                        Instruction *inst = &(*f_it);
                        if (CallInst *ci = dyn_cast<CallInst>(inst)) 
                        {
                            Function *calledFunc = ci->getCalledFunction();
                            if (calledFunc && calledFunc->hasName() && calledFunc->getName().str() == "exit") 
                            {
                                exitinsts.insert(inst);
                            }
                        }
                    }
                }  
            }
            Function* mainfunc = M.getFunction("main");
            BasicBlock &termbb = mainfunc->back();
            Instruction *ret = termbb.getTerminator();
            exitinsts.insert(ret);
            assert (exitinsts.size() != 0 && "Program does not have explicit exit point");
            for (std::set<Instruction*>::iterator it = exitinsts.begin(); it != exitinsts.end(); ++it) 
            {
                Instruction *term = *it;
                CallInst::Create(hook, "", term);
            }
        }
    };
}

char di_count::ID = 0;
static RegisterPass<di_count> X("di_count", "Count dynamic instruction number", false, false);
