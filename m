Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbjCKB2c (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 10 Mar 2023 20:28:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC6BF4C2E
        for <perfbook@vger.kernel.org>; Fri, 10 Mar 2023 17:27:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7ACD761D9D
        for <perfbook@vger.kernel.org>; Sat, 11 Mar 2023 01:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678498074;
        bh=TKfkHEZN2VS+rLOP9LIkoMV1k5kPcyOuB753Vd4iEms=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=iFH2mbz3GeouyDZeIosC/HF8iDD7KIF+o4R8nRPHh0C21CBL47IllcJ1R7QK70qPB
         RfZ46b6yd988xVufTbABVIMTpnkikYQlnlbpYnm91+XD5b5Tm0f1FarZ6RLQWIymSH
         Zp7WwCZ9JUKuzJHiSMFOpyJvQ0c5iRHtsmBa8qyJzGoX6cmlp9HmASGybrmQE32xbz
         3mV/df9fJbCiQSvl/KOkwFaxDJbGb5pAKVSEjN6iYbFOztRY2np2tLdRVR9zTM1Eya
         VJ8fjJFWZgBL3aFapF4GrDFV0lHQ9uCNIU8QyC7bBCWA2zIzO9KN0kAHIapD3TgEQd
         KYoSOp3mp64HQ==
Date: Fri, 10 Mar 2023 17:27:54 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [GIT PULL -perfbook] Improve portability of build scripts
Message-ID: <ce03141d-fc5c-4123-9052-1d3dc1e4b396@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <21e1a397-c9aa-2100-527c-e29191a918c2@gmail.com>
 <20fd9bd4-2081-4ee7-87da-5a827997dfbf@paulmck-laptop>
 <05efa3a2-488b-f5ab-1862-56c7c14950e9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05efa3a2-488b-f5ab-1862-56c7c14950e9@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Mar 11, 2023 at 08:10:07AM +0900, Akira Yokosawa wrote:
> On Fri, 10 Mar 2023 07:39:39 -0800, Paul E. McKenney wrote:
> > On Fri, Mar 10, 2023 at 11:06:56PM +0900, Akira Yokosawa wrote:
> >> Hi Paul,
> >>
> >> As I mentioned a month ago or so, I've been working on improving
> >> portability of building perfbook.
> >>
> >> By portability, I did actual tests mostly under FreeBSD and light weight
> >> alpine container images, not under macOS.
> >> So I don't know if this enables native build for macOS, but here we are.
> >>
> >> I don't expect any regression for existing build environments.
> >> (Famous last words!)
> >>
> >>         Thanks, Akira
> >> --
> > 
> > Seems to work, so I queued and pushed it.
> > 
> > On a separate topic, Ubuntu 22.04 seems to require "apt install fuse"
> > in addition to the list currently shown, but that might be an artifact
> > of my installation.  Without this, inkscape refuses to create PDFs.
> > (I am somewhat surprised that inkscape would require this.)
> 
> I think you are using an Appimage release of Inkscape.
> 
> This issue is covered here:
> 
>     https://docs.appimage.org/user-guide/troubleshooting/fuse.html#setting-up-fuse-2-x-alongside-of-fuse-3-x-on-recent-ubuntu-22-04-debian-and-their-derivatives

So it is not just me, then, thank you!!!

							Thanx, Paul
