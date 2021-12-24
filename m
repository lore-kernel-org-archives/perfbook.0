Return-Path: <perfbook-owner@vger.kernel.org>
Received: from ams.source.kernel.org ([145.40.68.75]:48092 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344365AbhLXUxM (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Fri, 24 Dec 2021 15:53:12 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 797D5B82325
        for <perfbook@vger.kernel.org>; Fri, 24 Dec 2021 20:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640379190;
        bh=xxbU7Rdhf/q0kTiPPx46JKcdgAL1bhrcPLOYZU9zwjw=;
        h=Date:From:To:Cc:Subject:Reply-To:From;
        b=TgF9XfsFG12toIhif4Bwx5JQw1Qa0Wjn8qBTXhIQzRc1hc/JOgM3j3xlBBzKC6nkC
         HC1GykqQHBzqxX/DbukEVFy4ZjJlbw5prrKbjOi7zmgm4rlOuYuzF7RoRBT2MSzdJA
         kUUymFoCmuY98yB3H/P6MlSDT2YLpnQE5jsbSTbyPW9/4GRtydvh215n/Fn8ElhKkb
         txg22y+CNAyEtvj0VhNLzUkj5pl+EK1Ko6UA4Y03S3I19d8sV1wUMbqzS4xZ9k6dty
         SKdfm1T6oxa7aVeBb6HJ66FhohiwCcAnuBaQHvnksuxAjKMXYF96q5kVXD3NnWkGx3
         qzVTxbJhsF6kw==
Date: Fri, 24 Dec 2021 12:53:09 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Draft blog post on v2021.12.21a release of perfbook
Message-ID: <20211224205309.GA1015523@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <perfbook.vger.kernel.org>
To: akiyks@gmail.com, sj38.park@gmail.com, bsingharora@gmail.com, shiyn.lin@gmail.com, e2lahav@gmail.com, luyang.co@gmail.com, zhouzhouyi@gmail.com, pat.github@tullmann.org
Cc: perfbook@vger.kernel.org

Hello!

I have drafted a blog post for the new release here:
https://paulmck.livejournal.com/66892.html

I have also added the epub build to the landing pages:
https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html

Finally, I updated the Arxiv version at https://arxiv.org/abs/1701.00854.
This is in "submitted" state, and may take a day or three to become visible.

In the meantime, please let me know of any errors or omissions!

I will post to my personal social media in a few days.

							Thanx, Paul
