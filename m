Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:42616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726388AbgCQVMz (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 17 Mar 2020 17:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584479575;
        bh=bUwpgjYbHQnCk/c2g8B4lsIh+keJLrQtCvN6ga3d6o0=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=I+7rUIx8zb0sLnX9OAOUXPen1W7LApRp7yEsJcRTgeJgxsKafXLOoyUAinLpqf3MT
         4/c5F6jBZ4+NXomBYFOicl2HARoOjIHh4Rf63Sq6zQgfpPQm3R/IKE9F5G8sO1dkqK
         x0cHTq0oudeWGnDFcEyD3tJkbkUnfhmrzO/PlBkg=
Date: Tue, 17 Mar 2020 14:12:55 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [RFC NOT PULL v2] Experiment to add background to question part
 of QQZ
Message-ID: <20200317211255.GN3199@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <1bca91e5-b192-85db-2035-6e524ee1cb57@gmail.com>
 <5f6f3513-82b5-5890-703b-e76d7890ae17@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f6f3513-82b5-5890-703b-e76d7890ae17@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Mar 17, 2020 at 11:48:48PM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> So this is the v2 of the "RFC NOT PULL".
> This contains a single commit to add experimental targets "2cqq" and "1cqq".
> It enables qqzbg (renamed from v1's bgqqz) in "msnt" and "1csf" as well.
> 
> Changes since v1:
> 
> * Rebased on current master.
> * To clarify the corresponding official targets, add targets "2cqq" and "1cqq"
> which uses the same fonts as "2c" and "1c".
> 
> Comments to the invitation message (just want to be sure):
> 
> > Subject: Experimental quick-quiz format at branch qqz.2020.03.14a
> 
> Whatever branch name here.
> 
> > 
> > 	Hello!
> > 
> > 	Akira has created a couple of new perfbook build targets
> > 	that use fancier formatting for quick quizzes.  You can
> > 	build with this fanciness by checking out branch qqz.2020.03.14a
> 
> ditto.
> 
> > 	of the perfbook git archive [1], and then typing:
> > 
> > 		make msnt  # Double-column format
> > 		make 1csf  # Single-column format
> 
> 		make 2cqq  # Double-column format
> 		make 1cqq  # Single-column format
> 
> > 
> > 	If you get a chance to do this and look it over, please let
> > 	Akira and I know what you think.  Any reason not to make this
> > 	format be the default for releases and editions?  (The reason
> > 	not to it the default for normal "make" builds is that the
> > 	price of the fanciness is a slower build time.)
> > 
> > 	Thoughts?
> > 
> > 							Thanx, Paul
> > 
> > 	[1] git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git
> 
> And please remove the old branch qqz.2020.03.14a from your tree to avoid
> any confusion.

Done, and the new branch name is qqz.2020.03.17a, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
> The following changes since commit efba3f18f0f619bcf6e82352cf3cddb6f8e607cb:
> 
>   defer/seqlock: Move figure env next to 1st paragraph (2020-03-16 09:08:42 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/akiyks/perfbook.git tags/for-paul-2020.03.17a
> 
> for you to fetch changes up to 01dcc70d3f66a1224ba63dc50bbe8370d3711c1b:
> 
>   qqz.sty: Add background color to Quiz part of Quick Quizzes (2020-03-17 20:24:09 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (1):
>       qqz.sty: Add background color to Quiz part of Quick Quizzes
> 
>  Makefile     | 12 +++++++++++-
>  perfbook.tex |  4 ++++
>  qqz.sty      | 31 ++++++++++++++++++++++++++++++-
>  3 files changed, 45 insertions(+), 2 deletions(-)
> 
