Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbiH2Nzf (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Mon, 29 Aug 2022 09:55:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D50E237D7
        for <perfbook@vger.kernel.org>; Mon, 29 Aug 2022 06:55:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 05A9960ED9
        for <perfbook@vger.kernel.org>; Mon, 29 Aug 2022 13:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661781333;
        bh=OOHDtgiZ4WdNLpvvj/w94CFpyAYxliEqiuRUh9vKMVk=;
        h=Date:From:To:Cc:Subject:Reply-To:From;
        b=EEM8QefK8DvuAVg+OEYYVtvp6jhbkXYZKlMWLFChv963LvgVrF9AydHeQSzWUahUi
         dF5pQHPNLKC1ARWmmK+Yj+4aA9pjY8gc1j4OC94h5BX7nsK7GnveF1hV4tmnTbwJXk
         n4R4PIn8yBo5wYq4+lfHSto1VhL6hcJc69i4Z1R6aeG4AJkBxXkZ+EzST7ACs7a/Cv
         A6H3fw5jeyULrNrOFqGW7EW8JS82iHC1cR/EhH/WlcjNbv10S4Vj3CZrnjWQbhklGI
         /pHs5RsoYoXF2hNT3RCT5MBErRKJaQYRVsxwV/Ch5o30ntIFbBUaDAuQhmQCll707+
         7CThWyXT0ns+w==
Date: Mon, 29 Aug 2022 06:55:33 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Upgraded temporal/spatial discussion
Message-ID: <20220829135533.GA1839874@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <perfbook.vger.kernel.org>
To: akiyks@gmail.com
Cc: perfbook@vger.kernel.org

Hello, Akira!

In response to your excellent feedback on my attempt to add a lumber
analogy to the temporal properties of locking, I have added the
following commits:

a7a722ddae4c ("SMPdesign: Work in the spacetime partitioning viewpoint")
cb7335f0af79 ("locking: Fold saw-kerf section into existing 7.1.4")
3d14659144cd ("defer/rcuusage: Relate RCU time/space properties to other primitives")

For completeness, the lumber analogy was attempted in these commits:

16131c2c320c ("locking: Add section describing temporal properties of locks")
8da652f6c958 ("locking: Add labels to saw-kerf diagram")
7f5c537e8a46 ("locking: Wordsmithing")

If these updates look good to you, I will cut a release.

							Thanx, Paul
