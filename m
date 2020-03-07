Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:48174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726231AbgCGB3I (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Fri, 6 Mar 2020 20:29:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583544548;
        bh=qA8p8e8lKIz1ZQq8ZrKb8skgE5ElH95EQBQMFvCiLhc=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=rkYRaZLbIkaITY3RLKlRytwj9bl8DQBA6rwFzBmd8+prqOiG7/+tk3QkHicVoA3Eq
         Z0tYmOiSLhdS+Sai4t6dzuwPGcNrYQSQWIhW7iCjiafPq4MTYJIdMVpumWDh4YvR9E
         bYyZlLyJMF22mEieK3Y1crhTB+Ji3MBoKVwU3W90=
Date: Fri, 6 Mar 2020 17:29:07 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/6] Improve page/column breaks in Appendix E
Message-ID: <20200307012907.GK2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <0a98646c-eb33-a27c-b974-ff38b8652a44@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a98646c-eb33-a27c-b974-ff38b8652a44@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Mar 07, 2020 at 07:46:44AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> I think I figured out the way to do what you wanted the other day.
> Instead of putting \goodbreak in \QuickQ, putting it in \QuickE
> looks like the right approach.
> 
> Patch 1/6 does the change.
> Patch 2/6 fixes a regression in the first attempt to put \goodbreak
> in front of QQZ.
> Patches 3/6--6/6 fix minor issues in QQAz.
> Feel free to rephrase the added opening sentence in Patch 4/6.

It looks fine!

Good stuff, queued and pushed, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (6):
>   qqz.sty: Improve page/column breaks in Appendix E
>   qqz.sty: Fix position of \goodbreak for accuracy of hyperlinks
>   toolsoftrade: Use nbsp in front of single letter variable
>   debugging: Add opening sentence in Answer to QQZ 11.2
>   defer/rcuusage: Reverse nesting of fcvref and enumerate envs
>   SMPdesign/partexercises: Move figure env next to first paragraph in QQA
> 
>  SMPdesign/partexercises.tex   | 15 +++++++--------
>  debugging/debugging.tex       |  2 ++
>  defer/rcuusage.tex            |  4 ++--
>  qqz.sty                       | 10 +++++-----
>  toolsoftrade/toolsoftrade.tex |  7 +++----
>  5 files changed, 19 insertions(+), 19 deletions(-)
> 
> -- 
> 2.17.1
> 
