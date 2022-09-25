Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbiIYWu2 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sun, 25 Sep 2022 18:50:28 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 568511F616
        for <perfbook@vger.kernel.org>; Sun, 25 Sep 2022 15:50:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0FB59B80D8C
        for <perfbook@vger.kernel.org>; Sun, 25 Sep 2022 22:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664146224;
        bh=3B1IR44iAziB2EX23qT0WiyQx0vwQ83m/3a4EhEnvJA=;
        h=Date:From:To:Cc:Subject:Reply-To:From;
        b=rEW2QZi2crBLG4Xs1Y/3XhfXBPjmbnG7jmVT50Q1aLvTP4GQ32wtETw5+NAWjik1X
         o7henMCNGBnJk8c4dKT/EFeKSIj63/vgnOb5rENt8iH10neU7o/y4he7D58O0xBIMJ
         UpDhTLWIqf5vKBx8EqJ1QDNSAZmZyhVMYuzCOovSsZH+r/1S2GT4gkdeX99DwQPcfG
         EqLuPWNlesiqg/Y6K9vygRqyq0iSdftSW1DslaYB+NDBHynB/Kf8zeeW+n7/xHkmvF
         ax0gaLw3YrFmNwEf+JsG+ZEOqly/fW3RXYslgPxzh+epmn8L6TEBJK4T04S7r2002E
         SG78ZxUD4DN+g==
Date: Sun, 25 Sep 2022 15:50:24 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: And, at long last, another perfbook release
Message-ID: <20220925225024.GA549132@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <perfbook.vger.kernel.org>
To: perfbook@vger.kernel.org
Cc: akiyks@gmail.com, e2lahav@gmail.com, johann@jklaehn.de, sj38.park@gmail.com, maplewish117@gmail.com, zhouzhouyi@gmail.com

Hello!

The new v2022.09.25a release of perfbook is available, and the draft
announcement is here:  https://paulmck.livejournal.com/68537.html
Thank you all for your contributions to this release!

Please let me know if changes are needed.  If I don't hear otherwise, I
will post this more widely by the end of tomorrow (Monday), Pacific Time.

							Thanx, Paul
