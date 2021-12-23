Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244178AbhLWQb4 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Thu, 23 Dec 2021 11:31:56 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFE2AC061401
        for <perfbook@vger.kernel.org>; Thu, 23 Dec 2021 08:31:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 78F54B81FC1
        for <perfbook@vger.kernel.org>; Thu, 23 Dec 2021 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640277114;
        bh=yoOnvlitTIV+wcXQQ+5J3/GjCA2pRSKecxZpmFK4C3g=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=TFs0dbImEp3jhC6F4FBcekNQKnBy2C16IRCi6chqS7PthQsEozeMkWh5HM4Zq3MI1
         NW7uYGaYjORHN4JZI3aeVnN/t+0fGAk6SH1tv3Djeye9amGJMX0QEblX2d6XieCTZG
         dxgiyLTwEOMu7m33lPRaTxqMyeObKKqHANGDUBybqAxfSnDqoO10CGOvFwLDxXb+0r
         J1Hyg6+ysTqAQj9hg+7VxIjCYq+gkNSxzltrCldKRAdVYYgw3YRKQvsL4ehtU1N8Nm
         Y/AtJlAbAAXcjIt/ZB3O2Hnm+5S+O5nIHoL7tTthB6GbMqp6amzKwj1HpAMRCHiP7Q
         s9+voGj5bwf5A==
Date: Thu, 23 Dec 2021 08:31:53 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: Suggestion to mention ebook-size build in perfbook's release
 announce
Message-ID: <20211223163153.GO4109570@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <c4a528a3-6c90-dc73-4870-5bb1c5918355@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4a528a3-6c90-dc73-4870-5bb1c5918355@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Thu, Dec 23, 2021 at 11:31:46PM +0900, Akira Yokosawa wrote:
> Hi Paul
> 
> In https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html,
> 
> There is a sentence "All attempts to generate epub formats for small-format
> ebook readers have produced horrible results, but if you know of something
> that works, please don't keep it a secret!".
> 
> Now that "make eb" and its variants can generate PDF for ebook readers
> (C6 paper), it might better to update this.
> 
> C6: 114mm x 162mm (4.49in x 6.38in)

Very good, and thank you all for all your work to make this happen.

On the next release, should I add a "make eb" .pdf to go with the
current double-column and single-column .pdf files?

(Currently working (slowly) on getting arxiv to accept recent changes.)

							Thanx, Paul
