Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244584AbiBBEtA (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 1 Feb 2022 23:49:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA820C06173D
        for <perfbook@vger.kernel.org>; Tue,  1 Feb 2022 20:48:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 94F54B82F79
        for <perfbook@vger.kernel.org>; Wed,  2 Feb 2022 04:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643777337;
        bh=uiOje63bEO98/neYRFEoUQAWitM+DDpksKDcRboJG8A=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=cEx52afIBjU9EtV5hfdiyBUSBGgnTPSHcNX/zo4EMrUYHp0WCYWQM7mMvY4u3DSQo
         rgM87p7AxtygTuA2e2LZYlOUNF9dr7XOhasX5K43EedOI2Ay9wf0vOJPbGTG8X3adf
         4GXrlx0upWBeCqws0YxYg3Y2lvX4P4TPjgSn9GgnML18ZLJABfVQXKoByNemT8YhS9
         cfob16rCcUI//mQjlwbEIOwrn+zQQnWRmlo/HwcU5z9Oc8kvZ57UvnHz/rNtQnq8p4
         Lw+ZEShLLXgvi+CZ/3QnLVDPBE8xX945VubulhbGdEiClXNQaKyL/iMo9er/Tccqwt
         +hrDl+nHnEx9Q==
Date: Tue, 1 Feb 2022 20:48:57 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: perfbook: a possible typo report
Message-ID: <20220202044857.GJ4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <CAABZP2zB4H-00wrLJPPS5CrVW-D1W_bgiECWnJRw7FvnYVrsVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABZP2zB4H-00wrLJPPS5CrVW-D1W_bgiECWnJRw7FvnYVrsVQ@mail.gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, Yang Lu <luyang.co@gmail.com>

On Wed, Feb 02, 2022 at 12:11:14PM +0800, Zhouyi Zhou wrote:
> Hi Paul and Akira
> 
> I found a possible typo in section 17.2.1,
> "This section therefore critiques transactional memory's ability to so
> interact,"
> 
> I tried to improve my English everyday, but I still can't tell whether
> "so interact" is good or not good.
> 
> Thanks for your time
> Reported-by: Zhouyi Zhou <zhouzhouyi@gmail.com>

Here is that paragraph:

	Whether we believe that input and output are "real programming"
	or not, the fact is that for most computer systems, interaction
	with the outside world is a first-class requirement. This
	section therefore critiques transactional memory's ability
	to so interact, whether via I/O operations, time delays, or
	persistent storage.

The "so interact" refers back to the "interaction with the outside world".
But I agree that this can be unclear.

The last sentence is thus shorthand for:

	This section therefore critiques transactional memory's ability
	to interact in this way with the outside world, whether via I/O
	operations, time delays, or persistent storage.

But this feels a bit repetitive.

Maybe something like this?

	Whether or not we believe that input and output are "real
	programming", the fact is that software absolutely must deal with
	the outside world.  This section therefore critiques transactional
	memory's outside-world capabilities, focusing on I/O operations,
	time delays, and persistent storage.

Thoughts?

							Thanx, Paul
