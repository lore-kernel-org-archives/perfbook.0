Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbfLEQuy (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 5 Dec 2019 11:50:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575564653;
        bh=r5rpjlOG07hjBo/cExfa+H/BNwD+IqhqSN19mjeWPSg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=GFDUA2YP88TrFJeGG6ugfIpRyCeV3megPrjdXJ1+B+BZBTn4Gw0FjWMyV80lslJ0M
         3pldKIA0NOGLu47lI+HZjH5J3vZIAbcvgbErvuAzcbkpje3DoLEczN6Ye9WjC+la80
         JXi/D4psP7A35PE7RDSLdK/ujfU/mcvMqq0tD6BY=
Date: Thu, 5 Dec 2019 08:50:53 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/3] Get rid of plain dashes for ranges
Message-ID: <20191205165053.GS2889@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <abbbd715-64b5-e210-240a-e18680f4e1ea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abbbd715-64b5-e210-240a-e18680f4e1ea@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Dec 06, 2019 at 12:14:30AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> In your recent updates, I see you have used endashes for range
> of numbers.
> 
> So I think it is high time to get rid of other plain dashes used
> for ranges.  After the change made in commit 38eec3194c9a
> ("Use \crefrange{}{} for range of figures"), there remain around
> twenty such plain dashes.
> 
> Patch #1 updates a case under bib/.
> Patch #2 takes care of other plain dashes.
> Patch #3 updates the section "En Dash" in style guide. It also adds
> a section on cross-reference.
> 
> Please permit the brevity of change logs in this set.

The added consistency is very nice, thank you!  Applied and pushed.

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (3):
>   bib/hw.bib: Use endash for volume range
>   treewide: Use endash for ranges
>   styleguide: Update on cross-reference and endash
> 
>  advsync/rt.tex                       |  2 +-
>  appendix/styleguide/styleguide.tex   | 92 ++++++++++++++++++++++------
>  appendix/toyrcu/toyrcu.tex           |  2 +-
>  appendix/whymb/whymemorybarriers.tex |  2 +-
>  bib/hw.bib                           |  2 +-
>  cpu/overheads.tex                    |  2 +-
>  datastruct/datastruct.tex            |  6 +-
>  defer/hazptr.tex                     |  2 +-
>  easy/easy.tex                        |  2 +-
>  future/formalregress.tex             |  2 +-
>  legal.tex                            |  2 +-
>  locking/locking.tex                  |  4 +-
>  12 files changed, 87 insertions(+), 33 deletions(-)
> 
> -- 
> 2.17.1
> 
