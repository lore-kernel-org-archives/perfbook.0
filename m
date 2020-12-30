Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726209AbgL3FiJ (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Wed, 30 Dec 2020 00:38:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7568A207B3
        for <perfbook@vger.kernel.org>; Wed, 30 Dec 2020 05:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609306648;
        bh=ofERFtoXKtMhkuKRYGiegwKxazrDS6nwP0vinLmrJgE=;
        h=Date:From:To:Subject:Reply-To:From;
        b=iVt4EJMbDyBxr0qdl2nfstIbvy8ifIh9ohgns/45iYMA0BDtykcQFOoexr/lfdt3c
         2JI2DQ31IkuqJVzRgIhamFhtwpdMmAWi8bF1RlXOc3ascuFVobvVaK61ZMrNHsKAFC
         4LFB0BVCVoq3XYNKPAdH7j6SOUuyNzSC6DTKsoa5YXDzlcP487h83MqFWt39Fw8wJF
         ybZz12fmO9GMC8QCt8vx6trQ95vxMTX7qsXKP2hDmI/eDK7xNIvkY3gIZxQT4DmL06
         gmAlrlW3Hxw0999W8r8wtBxLrWf/mzay1P035Gv2l3Ca3yL3JHABbx1eLWjl9iEIk9
         XKEq90oaTbcSw==
Date: Tue, 29 Dec 2020 21:37:28 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: FYI, Second Edition Release Candidate 1 now available
Message-ID: <20201230053728.GA31231@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org

Hello!

Release Candidate 1 of the Second Edition is now available, and I have
started a prototype blog entry: https://paulmck.livejournal.com/59935.html
Please let me know of any omissions or errors in this blog entry.  I expect
to post it to my social media accounts in a few days.

And thank you all for your interest in and contributions to perfbook!

							Thanx, Paul
