Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:37364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231206AbhKDBqW (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 3 Nov 2021 21:46:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635990224;
        bh=oegx71VEhOvmIjJWipqg0UWdhtpQT7Kq9PaTmkQi84g=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=COF3rh4x9X7H+7IXYmmAAiSnxvINl3/bNC2QxsiN8jRhSPCiHXWVf/cdijLEzKr6J
         Mr7NpAKX+F2YGsEUEY4LBRtlTd63exmKFNw0GK1KlktfwuWPs/jteKdipGQb3VkG/7
         U1Rsg603KX873V45Dkx9pxRPqiMo31mZSo0whr371Sr67G9UxtSmxBjggGFCUF11w5
         2xBiGlURFdLl4nVhsHj7gpj15S4fWu8Nql8cAQB4r5UlxODypMUvnoNnDuR4IuWxvU
         od3uABCeItm6rXY1RaH2q6IXk9QEEpDZHa0vU0pB9266u4yugE4DdmYPyv8v1W5U57
         7shr/24xQ2zTw==
Date: Wed, 3 Nov 2021 18:43:44 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: An issue of Inkscape on Fedora 35
Message-ID: <20211104014344.GE641268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <a91d3e7d-8c9b-095f-7e43-32f6031bb9df@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a91d3e7d-8c9b-095f-7e43-32f6031bb9df@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Nov 04, 2021 at 10:28:57AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> Fedora 35 has recently been released.
> I have noticed an issue of Inkscape there and opened a bug tracker [1].
> 
> [1]: https://bugzilla.redhat.com/show_bug.cgi?id=2018036
> 
> I'm not sure this can be resolved soon.
> 
> It's Fedora's nature that aggressively upgraded packages result in
> conflicts among them...
> 
> It might be better for you to keep Fedora 34 for editing SVG figures.

That does sound problematic, and thank you for tracking this down
and for the heads up!

We might need containers just to keep working combinations of packages
together?  :-/

							Thanx, Paul
