Return-Path: <perfbook-owner@vger.kernel.org>
Received: from dfw.source.kernel.org ([139.178.84.217]:45754 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345135AbiATAqg (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 19 Jan 2022 19:46:36 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 347616151D
        for <perfbook@vger.kernel.org>; Thu, 20 Jan 2022 00:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642639595;
        bh=/0yU5DDm4utDvAROCTtfxArfNqObQpvryYcaz/3eq0o=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=FdOqNkB58/iTPtRaPD8AjGRjfKDYuCTKuMG+rdLzDNoc7X2gy/wtPgOH8MfgwUVun
         Ri9dAZlMRCocS+ZxjTl+IISRjzeBU2Ccm1J/w6PO1EfhAoOtSW+XgaNxhipHxs+o67
         vq9Pvv0yqRIOdIlpY6kzZMdMJVJh84ZMQ/M6UbT/n3FB/SpNrylwH9O+sYyEC+S22l
         0NocfrBCGnbdQKI5RUnHRo9gXyyJIP89fwJaGNO13yYNXOLz2zp9Zq8s1CCKEg+v/y
         wK1/LNhVrU0Rt2NbRgSmjuyplR/+NR19++/sx7SxSP8oG5lOuoJ8ZKtyKAjmSh/QAj
         X1Hp2U4M7vGwg==
Date: Wed, 19 Jan 2022 16:46:35 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] glossary: Tweak indexing macro
Message-ID: <20220120004635.GO947480@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <93da8b35-d595-6638-93b5-b081f2dfc871@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93da8b35-d595-6638-93b5-b081f2dfc871@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Jan 20, 2022 at 09:28:59AM +0900, Akira Yokosawa wrote:
> Fix some of indexing tags so that they can co-exist with existing
> index items.
> 
> Fixes: 4e91046e35c9 ("glossary: Additions from index, A-E")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

And it would appear that you answered my question before I got around
to asking it.  ;-)

Queued and pushed, thank you very much!

							Thanx, Paul

> ---
>  glossary.tex | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/glossary.tex b/glossary.tex
> index 6c1c71e1..84472a9b 100644
> --- a/glossary.tex
> +++ b/glossary.tex
> @@ -9,7 +9,7 @@
>  	        David~Levary~et~al.}}
>  
>  \begin{description}
> -\item[\IXG{Amdahl's Law}:]
> +\item[\IXGr{Amdahl's Law}:]
>  	If sufficient numbers of CPUs are used to run a job that has both
>  	a sequential portion and a concurrent portion, performance and
>  	scalability will be limited by the overhead of the sequential
> @@ -228,7 +228,7 @@
>  	increase the overall cost of the computation, resulting in
>  	linear speedups as threads are added (assuming sufficient
>  	CPUs are available).
> -\item[\IXG{Energy Efficiency}:]
> +\item[\IXGalth{Energy Efficiency}{energy}{efficiency}:]
>  	Shorthand for ``energy-efficienct use'' in which the goal is to
>  	carry out a given computation with reduced energy consumption.
>  	Sublinear scalabilty can be an obstacle to energy-efficient use
> @@ -510,7 +510,7 @@
>  	to store to that pointer.
>  	More information is provided in
>  	\cref{sec:memorder:Address- and Data-Dependency Difficulties}.
> -\item[\IXGh{RCU Read-Side}{Critical Section}:] % @@@ Need all-caps RCU in index!
> +\item[\IXGalthmr{RCU Read-Side Critical Section}{RCU read-side}{critical section}:]
>  	A section of code protected by RCU, for example, beginning with
>  	\co{rcu_read_lock()} and ending with \co{rcu_read_unlock()}.
>  	(See ``Read-side critical section''.)
> 
> base-commit: 6abfa973f401e7b1fb696ba078376bce77126a4b
> -- 
> 2.17.1
> 
