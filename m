Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5195 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)	by vger.kernel.org
 with ESMTP id S1755170AbcGJOla (ORCPT	<rfc822;perfbook@vger.kernel.org>);
 Sun, 10 Jul 2016 10:41:30 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])	by
 mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6AEdF2G034426
 for <perfbook@vger.kernel.org>; Sun, 10 Jul 2016 10:41:29 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])	by
 mx0b-001b2d01.pphosted.com with ESMTP id 243enpufvv-1	(version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT)	for <perfbook@vger.kernel.org>; Sun,
 10 Jul 2016 10:41:29 -0400
Received: from localhost	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 10 Jul
 2016 10:41:28 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 0E47D38C8039
 for <perfbook@vger.kernel.org>; Sun, 10 Jul 2016 10:41:26 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u6AEfRbI39518396	for <perfbook@vger.kernel.org>; Sun, 10 Jul 2016 14:41:27
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u6AEfPpU032351	for <perfbook@vger.kernel.org>; Sun, 10 Jul 2016 10:41:25
 -0400
Date: Sun, 10 Jul 2016 07:41:41 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [GIT PULL] Cosmetic fixes round 3 and other fixes
Reply-To: paulmck@linux.vnet.ibm.com
References: <8ed6c47e-5844-4ee0-d42e-0c038f27daec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ed6c47e-5844-4ee0-d42e-0c038f27daec@gmail.com>
Message-Id: <20160710144141.GW4650@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jul 09, 2016 at 03:24:51PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Today, because of the weather, I have time to do clean up the cosmetic
> fixes. Appended are two pull requests.

Very good!  I pulled both and pushed them out.  I made a small change
to the label for the table that you (rightly) changed to a figure,
so that it is prefixed by "tab:" rather than "fig:".

							Thanx, Paul

> 1st one is of *non-cosmetic* fixes which are mostly typo fixes but
> requires careful review.
> 
> Note that the 1st commit "future: Miscellaneous possible fixes" contains
> both non-cosmetic and cosmetic fixes. I thought of separating them,
> but it is not so large and I assume it is not so difficult to review.
> If you don't agree, please blame me.
> 
> The last commit "Add 'hypcap' package to make hyperref go to top of
> figure and table" modifies the behavior of Table and Figure links
> in PDF. I think this is an improvement.
> 
> 2nd request is of *costmetic* fixes which are mostly the same fixes
> I have done lately. But there are other types of fixes included here.
> 
> In qqz, there are a few unnecessary paragraph breaks that affect the
> layout of Appendix D. On the other hand, there are a few places that
> require paragraph breaks but miss blank lines in the source.
> Those commits beginning with "qqz: " fix them.
> 
> The commits "Use \centering instead of center environment (part 1 -- 5)"
> abandon the use of "center" environment within "table" and "figure"
> environments and replac them with simple \centering commands.
> They remove extra vertical spaces above captions. These commits
> touch a lot of places and cause the large diff stats.
> 
> The following 3 commits tweaks layout and size of Tables and Figures.
> The changes made in commit "Tweak sizes and positions of Tables and
> Figures" should be thought of as tentative tweaks. And I'm not sure
> the editor likes the tweaks.
> 
> The last commit "SMPdesign: Restore effect of \cleardoublepage" is
> added because the changes made in this series result in a denser
> overall layout.
> 
> Note that "future: Miscellaneous possible fixes" is picked on both
> branches to avoid conflicts with later commits.
> 
>                                                 Thanks, Akira
> 
> ---
> The following changes since commit 009dcf8d442c61859cdbf06b221c9fbb5aa5fb91:
> 
>   Add RT chapter to the Section 1.1 roadmap (2016-07-08 19:55:22 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git non-cosmetic-fixes
> 
> for you to fetch changes up to 749479a4fa1cb9564b6683dd267fb99f4bdf5110:
> 
>   Add 'hypcap' package to make hyperref go to top of figure and table (2016-07-09 12:59:32 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (7):
>       future: Miscellaneous possible fixes
>       future: Use \QuickQuizARef{} for reference to QQA
>       after: Typo fixes
>       time: Typo fix
>       Typo fixes in Quick Quizzes
>       rt: Typo fix in QQA
>       Add 'hypcap' package to make hyperref go to top of figure and table
> 
>  advsync/memorybarriers.tex   |  2 +-
>  appendix/questions/after.tex |  4 ++--
>  appendix/questions/time.tex  |  2 +-
>  future/HTMtable.tex          |  3 ++-
>  future/HTMtableRCU.tex       |  2 +-
>  future/future.tex            |  4 ++--
>  future/htm.tex               | 16 ++++++++--------
>  future/tm.tex                |  6 +++---
>  locking/locking.tex          |  2 ++
>  perfbook.tex                 |  1 +
>  rt/rt.tex                    |  2 +-
>  together/applyrcu.tex        |  2 +-
>  12 files changed, 25 insertions(+), 21 deletions(-)
> 
> ---
> The following changes since commit 009dcf8d442c61859cdbf06b221c9fbb5aa5fb91:
> 
>   Add RT chapter to the Section 1.1 roadmap (2016-07-08 19:55:22 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git cosmetic-fixes-round-3
> 
> for you to fetch changes up to 67aae72180cbe2743b011ca5c0f123b3dffc41bc:
> 
>   SMPdesign: Restore effect of \cleardoublepage (2016-07-09 13:42:24 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (21):
>       future: Miscellaneous possible fixes
>       after: Centering figures of verbatim code examples
>       after: Tweak font size of Figure A.2
>       after: Use \path command for path names
>       primitives: Use \path for path name
>       primitives: Centering figures of verbatim code examples
>       qqz: Replace redundant blank lines with comment lines
>       qqz: Use \minipage{} environment for code snippet
>       qqz: Add blank lines for proper paragraph breaks
>       qqz: More replacement of redundant blank lines with comment lines
>       appendix: Centering tables and figures
>       Use \centering instead of center environment (part 1)
>       Use \centering instead of center environment (part 2)
>       Use \centering instead of center environment (part 3)
>       Use \centering instead of center environment (part 4)
>       Use \centering instead of center environment (part 5)
>       toolsoftrade: qqa: Add paragraph break around minipage
>       SMPdesign: Tweak table 'Schematic of Real-World Parallel Allocator'
>       defer: Use 'tabulary' for some tables
>       Tweak sizes and positions of Tables and Figures
>       SMPdesign: Restore effect of \cleardoublepage
> 
>  SMPdesign/SMPdesign.tex              | 89 +++++++++++++++---------------------
>  SMPdesign/beyond.tex                 | 36 +++++----------
>  SMPdesign/partexercises.tex          | 38 ++++++---------
>  advsync/memorybarriers.tex           | 76 +++++++++++++-----------------
>  advsync/rcu.tex                      | 18 +++-----
>  appendix/primitives/primitives.tex   | 42 ++++++++++-------
>  appendix/questions/after.tex         | 33 +++++++------
>  appendix/questions/time.tex          |  3 +-
>  appendix/rcuhist/RCUinLinux.tex      |  9 ++--
>  appendix/rcuimpl/rcupreempt.tex      | 30 ++++--------
>  appendix/rcuimpl/rcutree.tex         | 27 ++++-------
>  appendix/rcuimpl/rcutreewt.tex       | 12 ++---
>  appendix/rcuimpl/srcu.tex            |  9 ++--
>  appendix/whymb/whymemorybarriers.tex | 67 ++++++++++++---------------
>  count/count.tex                      | 47 ++++++++-----------
>  cpu/hwfreelunch.tex                  |  3 +-
>  cpu/overheads.tex                    | 10 ++--
>  cpu/overview.tex                     | 24 ++++------
>  datastruct/datastruct.tex            | 78 ++++++++++++-------------------
>  debugging/debugging.tex              | 20 +++-----
>  defer/defer.tex                      |  5 +-
>  defer/hazptr.tex                     |  2 +-
>  defer/rcuapi.tex                     | 65 ++++++++++++--------------
>  defer/rcufundamental.tex             | 21 +++------
>  defer/rcuintro.tex                   |  9 ++--
>  defer/rcuusage.tex                   | 42 +++++++----------
>  defer/refcnt.tex                     | 11 +++--
>  defer/seqlock.tex                    |  5 +-
>  defer/toyrcu.tex                     | 16 +++----
>  defer/whichtochoose.tex              |  3 +-
>  easy/easy.tex                        |  6 +--
>  formal/axiomatic.tex                 |  4 +-
>  formal/dyntickrcu.tex                |  3 +-
>  formal/spinhint.tex                  | 10 ++--
>  future/HTMtable.tex                  |  6 +--
>  future/HTMtableRCU.tex               |  7 ++-
>  future/cpu.tex                       | 24 ++++------
>  future/future.tex                    |  4 +-
>  future/htm.tex                       | 22 +++++----
>  future/tm.tex                        | 18 +++-----
>  intro/intro.tex                      | 18 +++-----
>  locking/locking.tex                  | 27 ++++-------
>  perfbook.tex                         |  1 +
>  rt/rt.tex                            | 48 +++++++------------
>  toolsoftrade/toolsoftrade.tex        | 15 +++---
>  45 files changed, 439 insertions(+), 624 deletions(-)
> 

