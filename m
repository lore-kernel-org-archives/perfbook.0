Return-Path: <SRS0=bx9V=YP=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=drQukSygiucjK5pJ9sFPqiqltJNgv+Nuv07EQkD8N9w=;
        b=bJgGdag97WbSD7AjlkTP6yY9dHqz+hUgtYRsAAYKJM5FnfUsjln6lCK/2iAP0Z5tsE
         SHTGzRur1dQs+YdWQiTY+Rs/RZ2tfvRRBNO5r6QnukzEgOdkzkKf1nbQ4rehksVqG7MB
         qChHa3XrNJpPxyP7ToNqZ9BVkVvqbXZxYXj5SKz/WJpPeT9f5dGgwDs5UNc6k/lZkmbJ
         0RRWq/8NwsgpR8+kcIZugNn3ApXeq1D+JH9vF3iik/E06Ct9dMfci1IUScOO/Ex/oGyw
         ZIVt57iqRJUvSvzMY5rKCH1RAmkSFEG1ZbWV4tAr3BsCrlHFXLBRnKZNTnQm1SCMJsDX
         ftaQ==
Subject: [PATCH v3 0/6] Enable SyncTeX forward (.tex -> .pdf) search
References: <fac2cbbb-492c-acde-14a8-15ee04b95ea9@gmail.com>
 <2d2eb3d6-d050-6f0c-aca5-b0cc76e8e0ec@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <eda1f6d1-50ef-8447-1eab-5db776eb3981@gmail.com>
Date: Tue, 22 Oct 2019 20:15:43 +0900
MIME-Version: 1.0
In-Reply-To: <2d2eb3d6-d050-6f0c-aca5-b0cc76e8e0ec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Balbir Singh <bsingharora@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Here is another attempt to enable SyncTeX forward search in perfbook.

This time, perfbook.synctex.gz will be generated only if you
set the environment variable LATEX_OPT=-synctex=1. The behavior
is not changed from current master.

I said in my reply to v2:

    ... this change does have regression in that the inverse search
    (PDF -> .tex) stops working other than perfbook.pdf.

It tuned out this was my misconception. Inverse search works
from other than perfbook.pdf with the "% mainfile: ...perfbook.tex"
lines added to sub .tex files.

So, patch #1 adds the "mainfile:" tags (pointing perfbook.tex) in
sub .tex files.
Patch #2 adds a script to retarget the destination of forward search
by modifying the "mainfile:" tags. It does nothing when LATEX_OPT
has no "synctex" setting.  For the details of the script, please
refer to the update of FAQ-BUILD.txt in patch #4.
Patch #3 adds "mainfile:" lines in extracted .tex files (qqz.tex,
origpub.tex, and contrib.tex).
Patch #4 updates FAQ-BUILD.txt to mention SyncTeX support in
perfbook.

Patches #5 and #6 update minor issues I noticed during the test
of SyncTeX search with perfbook-1c.pdf.

I don't think gedit is your choice of editor, but SyncTeX surely
helps in locating a particular .tex file you'd like to see.

Forward search is not complete in that it doesn't work in
.fcv files. It looks like gedit's SyncTeX support is sensitive
to suffix of .tex. I tried to add "mainfile" tags in .fcv files
on the fly, but ended up in vain.  Inverse search to .fcv files
works as expected.  There is a room of improvement to show where
those .fcv files come from. I'll see what can be done.

        Thanks, Akira
--
Akira Yokosawa (6):
  treewide: Add '% mainfile:' tags in headers in sub .tex files
  Add synctex-forward.sh
  Add output of '% mainfile: perfbook.tex' tags in extraction scripts
  FAQ-BUILD: Mention how to enable SyncTeX support
  defer/rcuintro: Convert snippet to new scheme
  defer/rcuapi: Tweak horizontal spacing of wide tables in 1c layout

 FAQ-BUILD.txt                             | 39 ++++++++++
 SMPdesign/SMPdesign.tex                   |  2 +
 SMPdesign/beyond.tex                      |  4 +-
 SMPdesign/criteria.tex                    |  1 +
 SMPdesign/partexercises.tex               |  2 +
 advsync/advsync.tex                       |  2 +
 advsync/rcu.tex                           |  2 +
 advsync/rt.tex                            |  2 +
 appendix/ack/ack.tex                      |  1 +
 appendix/appendix.tex                     |  1 +
 appendix/questions/after.tex              |  2 +
 appendix/questions/concurrentparallel.tex |  1 +
 appendix/questions/questions.tex          |  1 +
 appendix/questions/time.tex               |  1 +
 appendix/styleguide/styleguide.tex        |  1 +
 appendix/toyrcu/toyrcu.tex                |  2 +
 appendix/whymb/whymemorybarriers.tex      |  2 +
 count/count.tex                           |  2 +
 cpu/cpu.tex                               |  1 +
 cpu/hwfreelunch.tex                       |  1 +
 cpu/overheads.tex                         |  1 +
 cpu/overview.tex                          |  2 +
 cpu/swdesign.tex                          |  1 +
 datastruct/datastruct.tex                 |  2 +
 debugging/debugging.tex                   |  2 +
 defer/defer.tex                           |  1 +
 defer/hazptr.tex                          |  1 +
 defer/rcu.tex                             |  3 +-
 defer/rcuapi.tex                          |  6 +-
 defer/rcuexercises.tex                    |  1 +
 defer/rcufundamental.tex                  |  2 +
 defer/rcuintro.tex                        | 58 +++++++--------
 defer/rcurelated.tex                      |  2 +
 defer/rcuusage.tex                        |  2 +
 defer/refcnt.tex                          |  2 +
 defer/seqlock.tex                         |  2 +
 defer/updates.tex                         |  3 +-
 defer/whichtochoose.tex                   |  1 +
 easy/easy.tex                             |  1 +
 formal/axiomatic.tex                      |  2 +
 formal/dyntickrcu.tex                     |  2 +
 formal/formal.tex                         |  1 +
 formal/ppcmem.tex                         |  4 +-
 formal/sat.tex                            |  1 +
 formal/spinhint.tex                       |  2 +
 formal/stateless.tex                      |  1 +
 future/cpu.tex                            |  1 +
 future/formalregress.tex                  |  1 +
 future/future.tex                         |  1 +
 future/htm.tex                            |  2 +
 future/tm.tex                             |  2 +
 glossary.tex                              |  1 +
 howto/howto.tex                           |  2 +
 intro/intro.tex                           |  1 +
 legal.tex                                 |  1 +
 locking/locking-existence.tex             |  4 +-
 locking/locking.tex                       |  2 +
 memalloc/memalloc.tex                     |  1 +
 memorder/memorder.tex                     |  2 +
 owned/owned.tex                           |  2 +
 together/applyrcu.tex                     |  2 +
 together/count.tex                        |  1 +
 together/hash.tex                         |  1 +
 together/refcnt.tex                       |  2 +
 together/together.tex                     |  1 +
 toolsoftrade/toolsoftrade.tex             |  2 +
 utilities/extractcontrib.sh               |  1 +
 utilities/extractorigpub.sh               |  1 +
 utilities/extractqqz.sh                   |  1 +
 utilities/synctex-forward.sh              | 91 +++++++++++++++++++++++
 70 files changed, 266 insertions(+), 36 deletions(-)
 create mode 100755 utilities/synctex-forward.sh

-- 
2.17.1


