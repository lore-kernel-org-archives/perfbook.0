Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=O9Z8JR+rywzUPHt2ME94VhN+B+5sB60Bwglxhveoe7s=;
 b=JhPFOA+v8LzqAs9N34XJFEZhVrgfYL+geluErdm63rzeBEUWjiSBQPGm3MAmJjFV1O
 V8exn4RPrxxYyKipqVF8v/LQq2EjY+6bkL5ok/f9tvymsvhqQRZIsXpsD3QZepzPc0KS
 OZTZskp5PBLohV/DnJuSM1Upktcs1XwbHDoL1X/+rcb4kY54BakD9YqgHd9l9OdEZwQN
 HMoCb9Y0B04Dt2iaPWqwESwhZV+EeCzNIzMObjH+WpZtkVJm2d6rFsIDSRJ2e7nOFeIF
 /slv6mjKgFFPgmJPTGt3q0lmaSGI1oV+9Q03xpViXwTY8Sy0ihEvkoBsYcZ2L/ZTEQsB
 ZsnA==
Subject: Re: [RFT GIT PULL] Makefile: Add ".fig -> .eps" rule
References: <2d788653-610c-bc99-0d70-f86b96056c7e@gmail.com>
 <20160811175403.GB3482@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <89115e47-37d6-b563-435e-6dbecf078963@gmail.com>
Date: Fri, 12 Aug 2016 08:23:15 +0900
MIME-Version: 1.0
In-Reply-To: <20160811175403.GB3482@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/08/11 10:54:03 -0700, Paul E. McKenney wrote:
> On Fri, Aug 12, 2016 at 12:14:20AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> As I said the other day, I added a rule for ".fig -> .eps" in Makefile and
>> evaluate the increase in time of the first build (or builds after
>> "make neatfreak").
>>
>> To reduce the build time, 2nd patch moves several currently unused ".fig" files
>> to ".unused" sub-directories.
>> 3rd patch removes ".eps" files in the repository whose sources are ".fig" files.
>> 4th patch updates ".gitignore"s to reflect the removed files.
>> 5th patch updates FAQ-BUILD.txt to notify people that we now need the "fig2ps"
>> package for "fig2eps" command on Ubuntu.
>>
>> The result of the evaluation is as follows.
>> Time is measured by "time" command such as "$ make neatfreak; time make -j4"
>> on a virtual machine with 4 cpus. The "real" times are collected from the output.
>> The value in each cell is the simple average of 4 samples.
>>
>>              |before (sec)| after (sec)|            | 
>> no of thread | (1a508f6a) | (641b6a55) | diff (sec) | diff (%)
>>        1     |     141.8  |     153.5  |      11.7  |     8.3
>>        2     |      83.8  |      89.9  |       6.1  |     7.3
>>        3     |      64.7  |      68.8  |       4.1  |     6.3
>>        4     |      55.7  |      59.0  |       3.3  |     5.9
>>
>> As you may see, the time increase would be almost unnoticeable if you are
>> building with more than -j4.
>>
>> Of course, modification of Makefile needs to be fully tested before merging. 
>> I've tested myself doing the above evaluation.
>>
>> If you are satisfied with the change, please consider merging.
> 
> Hmmm...
> 
> Pulling this, and then cloning into a new repository gets me this:
> 
> $ make -j8
> SMPdesign/AllocatorPool.fig --> SMPdesign/AllocatorPool.eps
> make: *** [SMPdesign/AllocatorPool.eps] Error 127
> make: *** Waiting for unfinished jobs....
> SMPdesign/DiningPhilosopher5.tex --> SMPdesign/DiningPhilosopher5.eps
> 
> I get the same error if I do "make neatfreak" beforehand.
> 
> What am I doing wrong?

Does "make SMPdesign/AllocatorPool.eps" alone work?

If it does, then there might be an issue in highly parallel build...
Whew!

If it does not, please apply the patch to be sent in the following mail
on top of current "makefile-add-fig-eps-rule" branch, then do the single
make above, and send me the content of a temporary directory named
/tmp/xxxxxxxxxx (xxxxxxxxxx is a random name fig2eps generates) as a tar
archive.

If you do full build of perfbook after applying the patch, there will be
a lot of temporary directories left in /tmp and it may be hard to find
which one is that of SMPdesign/AllocatorPool.eps

> 
> 							Thanx, Paul
> 
>>                                                Thanks, Akira
>>
>> -----
>> The following changes since commit 1a508f6ad8b6d4e722c8511c459ae7ae9d2591b5:
>>
>>   Get .gitignore in right place for hash-table code (2016-08-10 16:14:18 -0700)
>>
>> are available in the git repository at:
>>
>>   https://github.com/akiyks/perfbook.git makefile-add-fig-eps-rule
>>
>> for you to fetch changes up to 641b6a5541323d737b1e2ca31e9a805da19514f1:
>>
>>   FAQ-BUILD.txt: Add 'fig2ps' as necessary package on Ubuntu (2016-08-11 22:50:02 +0900)
>>
>> ----------------------------------------------------------------
>> Akira Yokosawa (5):
>>       Makefile: Add .fig -> .eps rule
>>       Move unused .fig and .eps files to .unused directory
>>       Remove .eps files whose sources are .fig files
>>       Update and create .gitignore files
>>       FAQ-BUILD.txt: Add 'fig2ps' as necessary package on Ubuntu
>>
>>  FAQ-BUILD.txt                                      |    2 +-
>>  Makefile                                           |   18 +-
>>  SMPdesign/.gitignore                               |   10 +
>>  SMPdesign/AllocatorPool.eps                        |  287 --
>>  SMPdesign/LockGranularity.eps                      |  243 --
>>  SMPdesign/MazeNumberPath.eps                       |  157 -
>>  SMPdesign/MemoryBarrierPairing.eps                 |  218 --
>>  SMPdesign/ParallelFastpath.eps                     |  213 -
>>  SMPdesign/allocatorcache.eps                       |  225 --
>>  SMPdesign/lockdeqhash.eps                          |  218 --
>>  SMPdesign/lockdeqhash1R.eps                        |  784 ----
>>  SMPdesign/lockdeqhashlots.eps                      |  479 ---
>>  SMPdesign/lockdeqpair.eps                          |  177 -
>>  advsync/.gitignore                                 |   22 +
>>  advsync/.unused/MoreThanOneValue-15CPU-noresp.eps  | 1306 -------
>>  advsync/AbstractMemoryAccessModel.eps              |  191 -
>>  advsync/DataDependencyNeeded.eps                   |  775 ----
>>  advsync/DataDependencySupplied.eps                 |  738 ----
>>  advsync/MemoryArchitecture.eps                     |  327 --
>>  advsync/MemoryBarrierPairing.eps                   |  221 --
>>  advsync/MoreThanOneValue-15CPU.eps                 | 1306 -------
>>  advsync/MoreThanOneValue.eps                       |  200 -
>>  advsync/RCU-API.eps                                |  200 -
>>  advsync/RCUDeletion.eps                            |  253 --
>>  advsync/RCUInsertion.eps                           |  210 -
>>  advsync/RCUReaderGP.eps                            |  181 -
>>  advsync/RCUReaderGPExtends.eps                     |  199 -
>>  advsync/RCUReplacement.eps                         |  414 --
>>  advsync/ReadBarrierNeeded.eps                      |  673 ----
>>  advsync/ReadBarrierSupplied.eps                    |  693 ----
>>  advsync/ReadBarrierSupplied1.eps                   |  722 ----
>>  advsync/ReadBarrierSupplied2.eps                   |  699 ----
>>  advsync/SpeculativeLoad.eps                        |  603 ---
>>  advsync/SpeculativeLoadBarrier.eps                 |  595 ---
>>  advsync/SpeculativeLoadBarrierCancel.eps           |  633 ---
>>  advsync/SplitCache.eps                             |  250 --
>>  advsync/WriteBarrierOrdering.eps                   |  613 ---
>>  appendix/questions/.gitignore                      |    1 +
>>  appendix/questions/after.eps                       |  170 -
>>  appendix/rcuhist/{ => .unused}/linux-RCU.eps       |    0
>>  appendix/rcuhist/{ => .unused}/linux-RCUlock.eps   |    0
>>  appendix/rcuhist/{ => .unused}/rcuAPI.eps          |    0
>>  .../rcuimpl/{ => .unused}/AdvanceRCUCallbacks.fig  |    0
>>  .../rcuimpl/{ => .unused}/BigTreeClassicRCU.fig    |    0
>>  .../rcuimpl/{ => .unused}/BigTreeClassicRCUBH.fig  |    0
>>  .../{ => .unused}/BigTreeClassicRCUBHdyntick.fig   |    0
>>  appendix/rcuimpl/{ => .unused}/FlatClassicRCU.fig  |    0
>>  .../{ => .unused}/GenericRCUStateMachine.fig       |    0
>>  appendix/rcuimpl/{ => .unused}/GracePeriodBad.fig  |    0
>>  appendix/rcuimpl/{ => .unused}/RCUTreeInit.fig     |    0
>>  appendix/rcuimpl/{ => .unused}/RCUTreeLeafScan.fig |    0
>>  appendix/rcuimpl/{ => .unused}/RCUTreeQSScan.fig   |    0
>>  appendix/rcuimpl/{ => .unused}/RCUbweBlock.fig     |    0
>>  .../{ => .unused}/RCUpreemptCounterFlip.fig        |    0
>>  appendix/rcuimpl/{ => .unused}/RCUpreemptLists.fig |    0
>>  .../{ => .unused}/RCUpreemptListsCompare.fig       |    0
>>  .../rcuimpl/{ => .unused}/RCUpreemptStates.fig     |    0
>>  .../rcuimpl/{ => .unused}/RCUpreemptTimeline.fig   |    0
>>  .../rcuimpl/{ => .unused}/RCUpreemptValidation.fig |    0
>>  appendix/rcuimpl/{ => .unused}/RCUrt-MBnowaste.fig |    0
>>  appendix/rcuimpl/{ => .unused}/RCUrt-MBwaste.fig   |    0
>>  .../rcuimpl/{ => .unused}/TinyRCUCallbacks.fig     |    0
>>  appendix/rcuimpl/{ => .unused}/TreeClassicRCU.fig  |    0
>>  .../rcuimpl/{ => .unused}/TreeClassicRCUGP.fig     |    0
>>  appendix/rcuimpl/{ => .unused}/TreeMapping.fig     |    0
>>  .../rcuimpl/{ => .unused}/TreeRCUStateMachine.fig  |    0
>>  appendix/rcuimpl/{ => .unused}/srcuds.fig          |    0
>>  appendix/rcuimpl/AdvanceRCUCallbacks.eps           |  316 --
>>  appendix/rcuimpl/BigTreeClassicRCU.eps             |  286 --
>>  appendix/rcuimpl/BigTreeClassicRCUBH.eps           |  305 --
>>  appendix/rcuimpl/BigTreeClassicRCUBHdyntick.eps    |  462 ---
>>  appendix/rcuimpl/FlatClassicRCU.eps                |  254 --
>>  appendix/rcuimpl/GenericRCUStateMachine.eps        |  514 ---
>>  appendix/rcuimpl/GracePeriodBad.eps                |  194 -
>>  appendix/rcuimpl/RCUTreeInit.eps                   |  490 ---
>>  appendix/rcuimpl/RCUTreeLeafScan.eps               |  504 ---
>>  appendix/rcuimpl/RCUTreeQSScan.eps                 |  504 ---
>>  appendix/rcuimpl/RCUbweBlock.eps                   |  575 ---
>>  appendix/rcuimpl/RCUpreemptCounterFlip.eps         |  291 --
>>  appendix/rcuimpl/RCUpreemptLists.eps               |  220 --
>>  appendix/rcuimpl/RCUpreemptListsCompare.eps        |  311 --
>>  appendix/rcuimpl/RCUpreemptStates.eps              | 4120 --------------------
>>  appendix/rcuimpl/RCUpreemptTimeline.eps            |  351 --
>>  appendix/rcuimpl/RCUpreemptValidation.eps          |  696 ----
>>  appendix/rcuimpl/RCUrt-MBnowaste.eps               |  273 --
>>  appendix/rcuimpl/RCUrt-MBwaste.eps                 |  345 --
>>  appendix/rcuimpl/TinyRCUCallbacks.eps              |  233 --
>>  appendix/rcuimpl/TreeClassicRCU.eps                |  288 --
>>  appendix/rcuimpl/TreeClassicRCUGP.eps              |  730 ----
>>  appendix/rcuimpl/TreeMapping.eps                   |  219 --
>>  appendix/rcuimpl/TreeRCUStateMachine.eps           |  358 --
>>  appendix/rcuimpl/srcuds.eps                        |  268 --
>>  appendix/whymb/.gitignore                          |    7 +
>>  appendix/whymb/MESI.eps                            |  293 --
>>  appendix/whymb/cacheSB.eps                         |  216 -
>>  appendix/whymb/cacheSBf.eps                        |  247 --
>>  appendix/whymb/cacheSBfIQ.eps                      |  271 --
>>  appendix/whymb/cacheSC.eps                         |  150 -
>>  appendix/whymb/cacheSCwrite.eps                    |  170 -
>>  appendix/whymb/hostileordering.eps                 |  243 --
>>  count/.gitignore                                   |    5 +
>>  count/GlobalInc.eps                                |  429 --
>>  count/GlobalTreeInc.eps                            |  501 ---
>>  count/PerThreadInc.eps                             |  421 --
>>  count/count_lim.eps                                |  177 -
>>  count/globbal.eps                                  |  331 --
>>  cpu/.gitignore                                     |    2 +
>>  cpu/3DI.eps                                        |  193 -
>>  cpu/SystemArch.eps                                 |  395 --
>>  datastruct/.gitignore                              |    1 +
>>  datastruct/hashdiagram.eps                         |  301 --
>>  defer/.gitignore                                   |   10 +
>>  defer/GracePeriodGood.eps                          |  210 -
>>  defer/Linux_hlist.eps                              |  208 -
>>  defer/Linux_list.eps                               |  241 --
>>  defer/Linux_list_abbr.eps                          |  139 -
>>  defer/QSBRGracePeriod.eps                          |  255 --
>>  defer/RCUDeletion.eps                              |  253 --
>>  defer/RCUListDeleteClassic.eps                     |  328 --
>>  defer/RCUReplacement.eps                           |  470 ---
>>  defer/RCUenvAPI.eps                                |  214 -
>>  defer/rwlockRCUupdate.eps                          |  264 --
>>  formal/.gitignore                                  |    1 +
>>  formal/RCUpreemptStates.eps                        | 4120 --------------------
>>  intro/.gitignore                                   |    4 +
>>  intro/FourTaskCategories.eps                       |  261 --
>>  intro/FourTaskOrder.eps                            |  321 --
>>  intro/Generality.eps                               |  386 --
>>  intro/PPGrelation.eps                              |  165 -
>>  locking/.gitignore                                 |    5 +
>>  locking/DeadlockCycle.eps                          |  227 --
>>  locking/LayeredLockHierarchy.eps                   |  222 --
>>  locking/LocalLockHierarchy.eps                     |  221 --
>>  locking/NonLocalLockHierarchy.eps                  |  221 --
>>  locking/rnplock.eps                                |  305 --
>>  toolsoftrade/.gitignore                            |    1 +
>>  toolsoftrade/shellparallel.eps                     |  210 -
>>  137 files changed, 84 insertions(+), 41864 deletions(-)
>>  delete mode 100644 SMPdesign/AllocatorPool.eps
>>  delete mode 100644 SMPdesign/LockGranularity.eps
>>  delete mode 100644 SMPdesign/MazeNumberPath.eps
>>  delete mode 100644 SMPdesign/MemoryBarrierPairing.eps
>>  delete mode 100644 SMPdesign/ParallelFastpath.eps
>>  delete mode 100644 SMPdesign/allocatorcache.eps
>>  delete mode 100644 SMPdesign/lockdeqhash.eps
>>  delete mode 100644 SMPdesign/lockdeqhash1R.eps
>>  delete mode 100644 SMPdesign/lockdeqhashlots.eps
>>  delete mode 100644 SMPdesign/lockdeqpair.eps
>>  delete mode 100644 advsync/.unused/MoreThanOneValue-15CPU-noresp.eps
>>  delete mode 100644 advsync/AbstractMemoryAccessModel.eps
>>  delete mode 100644 advsync/DataDependencyNeeded.eps
>>  delete mode 100644 advsync/DataDependencySupplied.eps
>>  delete mode 100644 advsync/MemoryArchitecture.eps
>>  delete mode 100644 advsync/MemoryBarrierPairing.eps
>>  delete mode 100644 advsync/MoreThanOneValue-15CPU.eps
>>  delete mode 100644 advsync/MoreThanOneValue.eps
>>  delete mode 100644 advsync/RCU-API.eps
>>  delete mode 100644 advsync/RCUDeletion.eps
>>  delete mode 100644 advsync/RCUInsertion.eps
>>  delete mode 100644 advsync/RCUReaderGP.eps
>>  delete mode 100644 advsync/RCUReaderGPExtends.eps
>>  delete mode 100644 advsync/RCUReplacement.eps
>>  delete mode 100644 advsync/ReadBarrierNeeded.eps
>>  delete mode 100644 advsync/ReadBarrierSupplied.eps
>>  delete mode 100644 advsync/ReadBarrierSupplied1.eps
>>  delete mode 100644 advsync/ReadBarrierSupplied2.eps
>>  delete mode 100644 advsync/SpeculativeLoad.eps
>>  delete mode 100644 advsync/SpeculativeLoadBarrier.eps
>>  delete mode 100644 advsync/SpeculativeLoadBarrierCancel.eps
>>  delete mode 100644 advsync/SplitCache.eps
>>  delete mode 100644 advsync/WriteBarrierOrdering.eps
>>  create mode 100644 appendix/questions/.gitignore
>>  delete mode 100644 appendix/questions/after.eps
>>  rename appendix/rcuhist/{ => .unused}/linux-RCU.eps (100%)
>>  rename appendix/rcuhist/{ => .unused}/linux-RCUlock.eps (100%)
>>  rename appendix/rcuhist/{ => .unused}/rcuAPI.eps (100%)
>>  rename appendix/rcuimpl/{ => .unused}/AdvanceRCUCallbacks.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/BigTreeClassicRCU.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/BigTreeClassicRCUBH.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/BigTreeClassicRCUBHdyntick.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/FlatClassicRCU.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/GenericRCUStateMachine.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/GracePeriodBad.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/RCUTreeInit.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/RCUTreeLeafScan.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/RCUTreeQSScan.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/RCUbweBlock.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/RCUpreemptCounterFlip.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/RCUpreemptLists.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/RCUpreemptListsCompare.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/RCUpreemptStates.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/RCUpreemptTimeline.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/RCUpreemptValidation.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/RCUrt-MBnowaste.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/RCUrt-MBwaste.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/TinyRCUCallbacks.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/TreeClassicRCU.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/TreeClassicRCUGP.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/TreeMapping.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/TreeRCUStateMachine.fig (100%)
>>  rename appendix/rcuimpl/{ => .unused}/srcuds.fig (100%)
>>  delete mode 100644 appendix/rcuimpl/AdvanceRCUCallbacks.eps
>>  delete mode 100644 appendix/rcuimpl/BigTreeClassicRCU.eps
>>  delete mode 100644 appendix/rcuimpl/BigTreeClassicRCUBH.eps
>>  delete mode 100644 appendix/rcuimpl/BigTreeClassicRCUBHdyntick.eps
>>  delete mode 100644 appendix/rcuimpl/FlatClassicRCU.eps
>>  delete mode 100644 appendix/rcuimpl/GenericRCUStateMachine.eps
>>  delete mode 100644 appendix/rcuimpl/GracePeriodBad.eps
>>  delete mode 100644 appendix/rcuimpl/RCUTreeInit.eps
>>  delete mode 100644 appendix/rcuimpl/RCUTreeLeafScan.eps
>>  delete mode 100644 appendix/rcuimpl/RCUTreeQSScan.eps
>>  delete mode 100644 appendix/rcuimpl/RCUbweBlock.eps
>>  delete mode 100644 appendix/rcuimpl/RCUpreemptCounterFlip.eps
>>  delete mode 100644 appendix/rcuimpl/RCUpreemptLists.eps
>>  delete mode 100644 appendix/rcuimpl/RCUpreemptListsCompare.eps
>>  delete mode 100644 appendix/rcuimpl/RCUpreemptStates.eps
>>  delete mode 100644 appendix/rcuimpl/RCUpreemptTimeline.eps
>>  delete mode 100644 appendix/rcuimpl/RCUpreemptValidation.eps
>>  delete mode 100644 appendix/rcuimpl/RCUrt-MBnowaste.eps
>>  delete mode 100644 appendix/rcuimpl/RCUrt-MBwaste.eps
>>  delete mode 100644 appendix/rcuimpl/TinyRCUCallbacks.eps
>>  delete mode 100644 appendix/rcuimpl/TreeClassicRCU.eps
>>  delete mode 100644 appendix/rcuimpl/TreeClassicRCUGP.eps
>>  delete mode 100644 appendix/rcuimpl/TreeMapping.eps
>>  delete mode 100644 appendix/rcuimpl/TreeRCUStateMachine.eps
>>  delete mode 100644 appendix/rcuimpl/srcuds.eps
>>  create mode 100644 appendix/whymb/.gitignore
>>  delete mode 100644 appendix/whymb/MESI.eps
>>  delete mode 100644 appendix/whymb/cacheSB.eps
>>  delete mode 100644 appendix/whymb/cacheSBf.eps
>>  delete mode 100644 appendix/whymb/cacheSBfIQ.eps
>>  delete mode 100644 appendix/whymb/cacheSC.eps
>>  delete mode 100644 appendix/whymb/cacheSCwrite.eps
>>  delete mode 100644 appendix/whymb/hostileordering.eps
>>  delete mode 100644 count/GlobalInc.eps
>>  delete mode 100644 count/GlobalTreeInc.eps
>>  delete mode 100644 count/PerThreadInc.eps
>>  delete mode 100644 count/count_lim.eps
>>  delete mode 100644 count/globbal.eps
>>  create mode 100644 cpu/.gitignore
>>  delete mode 100644 cpu/3DI.eps
>>  delete mode 100644 cpu/SystemArch.eps
>>  create mode 100644 datastruct/.gitignore
>>  delete mode 100644 datastruct/hashdiagram.eps
>>  create mode 100644 defer/.gitignore
>>  delete mode 100644 defer/GracePeriodGood.eps
>>  delete mode 100644 defer/Linux_hlist.eps
>>  delete mode 100644 defer/Linux_list.eps
>>  delete mode 100644 defer/Linux_list_abbr.eps
>>  delete mode 100644 defer/QSBRGracePeriod.eps
>>  delete mode 100644 defer/RCUDeletion.eps
>>  delete mode 100644 defer/RCUListDeleteClassic.eps
>>  delete mode 100644 defer/RCUReplacement.eps
>>  delete mode 100644 defer/RCUenvAPI.eps
>>  delete mode 100644 defer/rwlockRCUupdate.eps
>>  create mode 100644 formal/.gitignore
>>  delete mode 100644 formal/RCUpreemptStates.eps
>>  create mode 100644 intro/.gitignore
>>  delete mode 100644 intro/FourTaskCategories.eps
>>  delete mode 100644 intro/FourTaskOrder.eps
>>  delete mode 100644 intro/Generality.eps
>>  delete mode 100644 intro/PPGrelation.eps
>>  create mode 100644 locking/.gitignore
>>  delete mode 100644 locking/DeadlockCycle.eps
>>  delete mode 100644 locking/LayeredLockHierarchy.eps
>>  delete mode 100644 locking/LocalLockHierarchy.eps
>>  delete mode 100644 locking/NonLocalLockHierarchy.eps
>>  delete mode 100644 locking/rnplock.eps
>>  create mode 100644 toolsoftrade/.gitignore
>>  delete mode 100644 toolsoftrade/shellparallel.eps
>>
> 
> 

