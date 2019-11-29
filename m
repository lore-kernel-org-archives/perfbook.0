Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:42798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726909AbfK2RTr (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Fri, 29 Nov 2019 12:19:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575047987;
        bh=pUNZZC+F0ZfTP0ZUyQ/92mXm5Udot8MWRcdBQnIvDSU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=wjZjJvg3WX9FxcRBIXWnNptNkR55lCzMY5yAzkBHN9mR3mP2DvmkneZuBbQ1+zata
         UUpLLED/z0di9wzEb4JMU38Q0kmCUhVzTmXk3Zdbn+4L8BUr+S0xTix94DM/876LYu
         viJjb2Jt1rv5MJP64J/6TwD44HszMGaC8ra4xCX4=
Date: Fri, 29 Nov 2019 09:19:46 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/3] toolsoftrade: Backport updates in LWN article
Message-ID: <20191129171946.GK2889@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <c132d968-1c16-ebfa-ca7f-9b3caff5eecb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c132d968-1c16-ebfa-ca7f-9b3caff5eecb@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Nov 29, 2019 at 07:24:21AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This patch set backports changes made in the LWN article "Who's afraid
> of a big bad optimizing compiler?" around store tearing.
> Although the origin of the article was Section 4.3.4.1, we can think
> of the article as the original publication of the section. There will
> likely be further updates in perfbook on this matter.
> 
> Patch #1 adds entries in bib/swtools to be cited in Patch #2.
> Patch #2 does the backport, with the report in 2013 being kept
> in a citation.
> Patch #3 is a cosmetic change in the beginning of Section 4.3.4.4.
> 
>         Thanks, Akira

Excellent, thank you very much!!!

I added "()" to a WRITE_ONCE(), but otherwise queued and pushed this
series as-is.

							Thanx, Paul

> --
> Akira Yokosawa (3):
>   bib/swtools: Add entries of reports on store tearing
>   toolsortrade: Backport LWN article
>   toolsoftrade: Use 'quote' for made-up dialogue
> 
>  bib/swtools.bib               | 18 ++++++++++++++++
>  toolsoftrade/toolsoftrade.tex | 39 +++++++++++++++++++++++++----------
>  2 files changed, 46 insertions(+), 11 deletions(-)
> 
> -- 
> 2.17.1
> 
