Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726506AbgCOD0n (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 14 Mar 2020 23:26:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584242802;
        bh=3KVAWQ5B/mP9Bp5eEIh47ZZBV15kZxlHKJNeYtUXzjk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=zaY6b3gIkqpV97HltSB88RkoFiEV6W2D4hlFHjTVuLhyM34SoO4+tzxiRq1t0SvSE
         Oo+QERhld8+c/4tKpTWLylvx+Elyi+Q6uh6g3J/R3Wl6HNrGbJA7VN2zfEZQTS4NaO
         46Jy9a2WENb93mMkeCqlKWyNI63ETjnBNqVbTWdw=
Date: Sat, 14 Mar 2020 20:26:41 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [RFC NOT PULL] Experiment to add background to question part of
 QQZ
Message-ID: <20200315032641.GR3199@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <1bca91e5-b192-85db-2035-6e524ee1cb57@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bca91e5-b192-85db-2035-6e524ee1cb57@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Mar 15, 2020 at 09:40:37AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> I have been experimenting to make question part of QQZ stand out.
> At the moment, official targets are not affected by the change.
> You can see the new look by building targets "msnt" and "1csf".
> 
> Another added target "noqq" is an experiment to remove inline questions.
> Anchors to the QQAs in Appendix E are presented at the right side of
> the column.
> 
> To make noqq to work, I need to change the \QuickQuiz{} macro format
> so that the question part is enclosed in "{ ... }".
> 
> Please give them a try and share your thoughts.

Interesting, thank you for looking into this and putting it together!

The msnt version looks rather nice, actually.  The 1scf in addition
might be quite a bit nicer for small-format devices, given the plain font.

The noqq version was generally OK, but there are some places with
multiple consecutive quick quizzes that look a bit strange, for example,
the first column of the Counting chapter.  But people who don't like
being distracted by quick quizzes might like it.  ;-)

What are your thoughts on how to proceed with this?  Were you thinking
in terms of running it by a few people to get more feedback?  Or did
you have something else in mind?

							Thanx, Paul

>         Thanks, Akira
> --
> The following changes since commit c811727b76356d53dff7614d3361353527953dd1:
> 
>   legal: Add a statement of the obvious (2020-03-14 14:20:11 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/akiyks/perfbook.git tags/for-paul-2020.03.15a
> 
> for you to fetch changes up to c5b74e161c4e1e6e5009f95c8e96cc34d906fe14:
> 
>   defer/seqlock: Move figure env next to 1st paragraph (2020-03-15 08:51:18 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (6):
>       treewide: Renew format of Quick Quiz macro
>       howto: Update Answer to QQZ 1.3 to mention inline QQA is not possible
>       Add experimental target 'noqq' (sans inline Quick Quizzes)
>       EXP qqz.sty: Add background color to Quiz part of Quick Quizzes
>       intro: Use 'VerbatimU' env for command output
>       defer/seqlock: Move figure env next to 1st paragraph
> 
>  Makefile                                  |   8 +-
>  SMPdesign/SMPdesign.tex                   |  42 ++--
>  SMPdesign/criteria.tex                    |   6 +-
>  SMPdesign/partexercises.tex               |  72 +++---
>  advsync/rcu.tex                           |  24 +-
>  advsync/rt.tex                            |  60 ++---
>  appendix/questions/after.tex              |  12 +-
>  appendix/questions/concurrentparallel.tex |  12 +-
>  appendix/questions/ordering.tex           |   6 +-
>  appendix/toyrcu/toyrcu.tex                | 162 ++++++-------
>  appendix/whymb/whymemorybarriers.tex      |  84 +++----
>  count/count.tex                           | 384 +++++++++++++++---------------
>  cpu/cpu.tex                               |   6 +-
>  cpu/hwfreelunch.tex                       |   6 +-
>  cpu/overheads.tex                         |  31 +--
>  cpu/overview.tex                          |  12 +-
>  cpu/swdesign.tex                          |  12 +-
>  datastruct/datastruct.tex                 |  84 +++----
>  debugging/debugging.tex                   | 152 ++++++------
>  defer/hazptr.tex                          |  42 ++--
>  defer/rcuapi.tex                          |  54 ++---
>  defer/rcuexercises.tex                    |  12 +-
>  defer/rcufundamental.tex                  |  36 +--
>  defer/rcuintro.tex                        |  42 ++--
>  defer/rcurelated.tex                      |   6 +-
>  defer/rcuusage.tex                        |  78 +++---
>  defer/refcnt.tex                          |  30 +--
>  defer/seqlock.tex                         |  62 ++---
>  defer/whichtochoose.tex                   |  18 +-
>  easy/easy.tex                             |  18 +-
>  formal/axiomatic.tex                      |  36 +--
>  formal/dyntickrcu.tex                     |  90 +++----
>  formal/formal.tex                         |  12 +-
>  formal/ppcmem.tex                         |  30 +--
>  formal/spinhint.tex                       |  48 ++--
>  future/formalregress.tex                  |  42 ++--
>  future/htm.tex                            |  54 ++---
>  future/tm.tex                             |   6 +-
>  howto/howto.tex                           |  30 ++-
>  intro/intro.tex                           |  94 ++++----
>  locking/locking-existence.tex             |  18 +-
>  locking/locking.tex                       | 156 ++++++------
>  memorder/memorder.tex                     | 246 +++++++++----------
>  owned/owned.tex                           |  42 ++--
>  perfbook.tex                              |   8 +
>  qqz.sty                                   |  53 ++++-
>  together/applyrcu.tex                     |  30 +--
>  together/hash.tex                         |   6 +-
>  together/refcnt.tex                       |  42 ++--
>  toolsoftrade/toolsoftrade.tex             | 210 ++++++++--------
>  utilities/extractqqz.sh                   |   8 +-
>  51 files changed, 1449 insertions(+), 1385 deletions(-)
