Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357822AbiATAf0 (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 19 Jan 2022 19:35:26 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42108C061574
        for <perfbook@vger.kernel.org>; Wed, 19 Jan 2022 16:35:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F1B43B8180B
        for <perfbook@vger.kernel.org>; Thu, 20 Jan 2022 00:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642638923;
        bh=M3Az/eEHutkMTKvw4k+dXZXxwmJODJnfTdhhGCf1KHU=;
        h=Date:From:To:Cc:Subject:Reply-To:From;
        b=lCy9QAaA/wgbtMTyV809kD1K370VK3Qbm0Mrat3NUCHgTjDWGdAYLG4HrSYseRmjV
         Yjd9K+/xlJEuAcr2MD0YsCvn1wk/dsqoVLvAhIK4MJ4NQJkyfY9xlm8Wf8vPwON8i9
         i6mevg9JWkPDXLhknM1LOxbO7rqhW4IZHlCdX3HiuCUYhVFC0b5sWF6rs1UGD5EWGQ
         MM9LufSOTE4qXWvQKKf2hpCYyOB8TsEPZl1EnpOTeHxhBRufAUFrhiKpwoO9eIUAos
         j6nXoak91jtUrNBefMl7Nd0CH0qDiAqKYdL15Ca5BGOzdq7a7URT/1W0U7j1mVeigd
         He3Wh9D+lg98w==
Date: Wed, 19 Jan 2022 16:35:23 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Question on glossary entry
Message-ID: <20220120003523.GA3377846@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <perfbook.vger.kernel.org>
To: akiyks@gmail.com
Cc: perfbook@vger.kernel.org

Hello, Akira,

I pushed out some additions to the glossary, but the entry for
"RCU Read-Side Critical Section" is proving a challenge.  It is a
hierarchical entry under "Critical section", but contains "RCU" which
should be capitalized.  I tried a number of things, perhaps most notably
"\IXGalth{RCU Read-Side}{Critical Section}{RCU Read-Side}", but no joy.

Could you please tell me what trick I am missing?

							Thanx, Paul
