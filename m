Return-Path: <SRS0=HWNT=5C=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rgJGnoLiKT1BXTIg/KNguVtC4ejD/DDNVmA3OKQkNMc=;
        b=OEQ/v5u+yhshWma0476uITGVzirnsTWt73W0eG1EoZG6erOUX/EeuetgKs3BSqcOkd
         L65IcVNDT3Tj/oFPs/LzizwiI/O50SS0qTUgw1DzBau4+xqq9JYwhqgbBMXSw1YIXqdl
         6ptGd2gXNND8r9Cvi7kM28V0j86910tb5oCBCarIomlXiJC7MHRg5wJFdbUSgpTQZws3
         n0uIqWugLrv/OLtcHZHaGjo33F6RZzBuJGymvcf4aIdyN9JJnM4qPqVMkvjBHZLJHHoc
         VXw+O756xyvj0OTUSfOiQDKj6W63pIqidobYKaLRhNWIJVbF0dTNjqfPuNadnc04L+zK
         lQVQ==
Subject: [RFC NOT PULL v2] Experiment to add background to question part of
 QQZ
References: <1bca91e5-b192-85db-2035-6e524ee1cb57@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5f6f3513-82b5-5890-703b-e76d7890ae17@gmail.com>
Date: Tue, 17 Mar 2020 23:48:48 +0900
MIME-Version: 1.0
In-Reply-To: <1bca91e5-b192-85db-2035-6e524ee1cb57@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

So this is the v2 of the "RFC NOT PULL".
This contains a single commit to add experimental targets "2cqq" and "1cqq".
It enables qqzbg (renamed from v1's bgqqz) in "msnt" and "1csf" as well.

Changes since v1:

* Rebased on current master.
* To clarify the corresponding official targets, add targets "2cqq" and "1cqq"
which uses the same fonts as "2c" and "1c".

Comments to the invitation message (just want to be sure):

> Subject: Experimental quick-quiz format at branch qqz.2020.03.14a

Whatever branch name here.

> 
> 	Hello!
> 
> 	Akira has created a couple of new perfbook build targets
> 	that use fancier formatting for quick quizzes.  You can
> 	build with this fanciness by checking out branch qqz.2020.03.14a

ditto.

> 	of the perfbook git archive [1], and then typing:
> 
> 		make msnt  # Double-column format
> 		make 1csf  # Single-column format

		make 2cqq  # Double-column format
		make 1cqq  # Single-column format

> 
> 	If you get a chance to do this and look it over, please let
> 	Akira and I know what you think.  Any reason not to make this
> 	format be the default for releases and editions?  (The reason
> 	not to it the default for normal "make" builds is that the
> 	price of the fanciness is a slower build time.)
> 
> 	Thoughts?
> 
> 							Thanx, Paul
> 
> 	[1] git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git

And please remove the old branch qqz.2020.03.14a from your tree to avoid
any confusion.

        Thanks, Akira
--
The following changes since commit efba3f18f0f619bcf6e82352cf3cddb6f8e607cb:

  defer/seqlock: Move figure env next to 1st paragraph (2020-03-16 09:08:42 -0700)

are available in the Git repository at:

  https://github.com/akiyks/perfbook.git tags/for-paul-2020.03.17a

for you to fetch changes up to 01dcc70d3f66a1224ba63dc50bbe8370d3711c1b:

  qqz.sty: Add background color to Quiz part of Quick Quizzes (2020-03-17 20:24:09 +0900)

----------------------------------------------------------------
Akira Yokosawa (1):
      qqz.sty: Add background color to Quiz part of Quick Quizzes

 Makefile     | 12 +++++++++++-
 perfbook.tex |  4 ++++
 qqz.sty      | 31 ++++++++++++++++++++++++++++++-
 3 files changed, 45 insertions(+), 2 deletions(-)

