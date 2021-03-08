Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232465AbhCHEDn (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 7 Mar 2021 23:03:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615176223;
        bh=KW6tXdgGySk2on4sZ5p72pUaYum1JvFTqzjkvRf9vlw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=biWjg1pCsukgXCr4aoUd7r12S3lK2f1aMfD607xXjQILuO3p6UKA/kYzD5SB20Ryq
         D4Km8N7mLemo5pKpYSSUKsUhgdlfgsweiTCpMMtXbPwPFUWaQrVwg5jvXWl0KaZ2dW
         s8+6zfqYcRpj3gO4nqn7W01dAtV31GgjCQrP5B8b8mwdvJCIuTT6WCL7Ikty40maPt
         j5VtxPoZLLystcj7AMjvv8fuJH2WnAwkI4cq/txDKclqJ0uFFdMmDndhbZpLn/CNo0
         K93Ah1oYyoNkz1vtiYECN3BYYMD0/2cUNebUa1+5o1OK+bkhzGG5E0nGGLpY0f/90e
         xiKc0yHixKeJw==
Date: Sun, 7 Mar 2021 20:03:43 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/4 -perfbook] Cite recent editions of textbooks; Fix
 indexing macro
Message-ID: <20210308040343.GL2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <3736cb6b-843d-c8b5-033c-80d4915010fc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3736cb6b-843d-c8b5-033c-80d4915010fc@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Mon, Mar 08, 2021 at 10:52:22AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This patch set adds citations to a couple of recent textbooks in
> howto's "Alternatives to This Book".
> It also includes fixes of \ppl*{} macro usages.
> 
> Patch 1/4 adds some of recent editions of "classic" textbooks
> mentioned in "Alternatives to This Book". It also adds/fixes a few
> doi info elsewhere.
> 
> Patch 2/4 updates howto.tex to add citations to those textbooks.
> 
> I have not checked if those recent editions keep the contents referred
> to in this section, though.  Especially, "C++ Concurrency in Action,
> 2nd Edition" has omitted the sub title of "Practical Multithreading".
> 
> So there might be a room to adjust context in the list. 

They look good to me.

> Patch 2/4 also fixes a few issues of \ppl{}{} macro usages.
> Index markings of "Hennessy" and "Patterson" you added in commit
> dbafd71e3c2e ("howto: Updates and wordsmithing") don't match
> existing markings in cpu.tex, which resulted in duplicates in
> the the Index page.
> Also, as they are pretty famous professors, I used \pplsur{}{} to
> display only their family names.
> 
> Patches 3/4 and 4/4 are minor updates to use fully spelled first
> names in index where possible.  

All applied and pushed, thank you!

							Thanx, Paul

> Akira Yokosawa (4):
>   bib: Add recent editions of textbooks
>   howto: Cite recent editions of textbooks
>   defer/rcurelated: Spell first names of Lehman and Weizenbaum for index
>   bib/RCU: Spell first name of Lehman in Kung80
> 
>  bib/RCU.bib          |  2 +-
>  bib/hw.bib           | 10 ++++++++++
>  bib/os.bib           |  7 +++++++
>  bib/parallelsys.bib  |  8 +++++---
>  bib/syncrefs.bib     | 28 ++++++++++++++++++++++++++++
>  cpu/cpu.tex          |  2 +-
>  defer/rcurelated.tex |  4 ++--
>  howto/howto.tex      | 19 ++++++++++---------
>  8 files changed, 64 insertions(+), 16 deletions(-)
> 
> -- 
> 2.17.1
> 
