Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728609AbgAVBKH (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 21 Jan 2020 20:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579655407;
        bh=ONTWAJwhiVpGu7wo7eMZtwSA6hGZ7YTw1CBAt7RtPmo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=jShwGyhhkkxF4py7rCM1sZeg6wwzrrfcgpRMCwEaO1zRlEO8q+hXSfUzmFJ1Y8BEI
         Nac1I/guCX+RrPNo/cHxothGg/3uRLFLUA4sfjlJscWBnQBBFWVPxIOc6gntccyclD
         6EDrevhKQo3pHxnNQ81WzTtiWFksL8Vxl+XKMmUQ=
Date: Tue, 21 Jan 2020 17:10:06 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/2] count: Prevent line breaks in the middle of 'and n.m'
Message-ID: <20200122011006.GA2935@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <c9d3fde2-92e4-f65a-bcd9-5c81271a1727@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9d3fde2-92e4-f65a-bcd9-5c81271a1727@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jan 22, 2020 at 07:34:26AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Patch 1/2 is a conservative application of \cref{} in count/count.tex.
> I observed the line breaks in 2C layout while I tweaked Figure 5.8.
> As it involves changes in a label string which has quite a few
> referenece site, its size becomes larger than I expected.
> 
> Patch 2/2 is a follow-up patch to move floats away from top of
> sections.

Queued and pushed, thank you!

Good caution on the use of commas in label as well.

							Thanx, Paul

>       Thanks, Akira
> --
> Akira Yokosawa (2):
>   count: Prevent line breaks in the middle of 'and n.m'
>   count: Move floats away from top of sections
> 
>  count/count.tex | 84 ++++++++++++++++++++++++-------------------------
>  owned/owned.tex |  4 +--
>  2 files changed, 44 insertions(+), 44 deletions(-)
> 
> -- 
> 2.17.1
> 
