Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiJTXkv (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 20 Oct 2022 19:40:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B8B510324B
        for <perfbook@vger.kernel.org>; Thu, 20 Oct 2022 16:40:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4C09CB828B2
        for <perfbook@vger.kernel.org>; Thu, 20 Oct 2022 23:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666309248;
        bh=7x8T7stQLI90jCbos4uY5TM8AG4EEGkyrJUynJpXdjw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=jPsyNdwS7t1VopWBjjtD/ziV7KngWYWsGqfOFSm2rWGpEueiNJXHZPO+6IXAmuggR
         U92AfFa9NKg/1OY4/5CuHkWODNHANpkUk6BRLc83MiRtGZS6YsK6vOE2Mr0lBOALBX
         BPzq6/CCS4I7D/pFgqpbr2xMbuOeR+JsBYH6zxkDzzFmUux+txzjpZvnm6M5Zp6Qn8
         SYmgSFXvhdR9f2kPuEZ02zyNtO7UEXwb0HPphDih/p0Ff56K/gkjA/Hz94LyH8nuzk
         y6V4siUT0nPCcpFPIVNPOlmML789chrJlbIUBNkSlJVpZ/pj+NqwaYbWn1Zk6NMWyl
         qgt4+Q4qDZxqQ==
Date: Thu, 20 Oct 2022 16:40:47 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] locking: Warn about state preservation when releasing
 and re-acquiring locks
Message-ID: <20221020234047.GD5600@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220929121112.373983-1-e2lahav@gmail.com>
 <20221006125822.GT4196@paulmck-ThinkPad-P17-Gen-1>
 <CAJbg=FXkbWPU4naA+DHQGbLk+n-7me+xR8fZ0Xc9d5phMkrPyw@mail.gmail.com>
 <20221006180659.GZ4196@paulmck-ThinkPad-P17-Gen-1>
 <c94f3757-5e8a-aeee-d836-eeccf6ae6d50@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c94f3757-5e8a-aeee-d836-eeccf6ae6d50@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Elad Lahav <e2lahav@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Oct 16, 2022 at 08:41:32AM -0400, Elad Lahav wrote:
> > > > Also, longer term, would you be willing to add code that makes a
> > > > simple but dangerous change in order to better illustrate the problem?
> I sent a patch, but I'm actually not too thrilled with it.
> 
> The original code was using nd->children[i], which I believe forces a
> compliant compiler to re-read nd->children, avoiding the problem. I was
> unable to get GCC 8.3 to cache nd->children, even when making the iterator
> and the callback take a pointer to a const node. With the new version, which
> uses an explicit iterator, the compiler does store nd->children in a
> register that is not reloaded across the loop.
> 
> The example I propose can thus fall under the category of "don't do that".
> On the other hand, this is just supposed to be a small, self-contained
> illustration of the danger.
> 
> What do you think?

I took it as is.  Many people would not believe that the pointer is
all that different than the array access.

Thank you!

							Thanx, Paul
