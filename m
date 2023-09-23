Return-Path: <perfbook-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbjIWQeS (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Sat, 23 Sep 2023 12:34:18 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A215792
        for <perfbook@vger.kernel.org>; Sat, 23 Sep 2023 09:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695486852;
        bh=3ZD1Lt+asmoMK3zjX092rlFZhynBiB+K8eHA+UM7+c0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Boq9qjqtHJ0rtH5WZF0T1h+OCj7lyy/Kgs5i/cO6RqZIZGnODe8xiddxu6+itHPj6
         iAHeCgANQFKZVXMz4AfL6qot6sG1wvozc0nLVYlpQbTzLT85RwMhzQOTJ4BXM14aTy
         e9Xc4u66NN/SJv5nAm8JVNHCwuLwVeRfEGUaUPN1nsktEUguhVKzMfNos+z6dd581F
         vLYDgpItkw2q5EFk3ZNFKjnfMGVozQrbjAtDPb6Xc85GFCZf+GPxABSbuFT8DBOgAh
         abIWhdYOuk8vl3PW1TIstCwtVNlmyJH+Y5XIjQbyLOPtoG7FdvjbbRIUF1tWYhLIWL
         mIA5qoLuOmfQg==
From: SeongJae Park <sj@kernel.org>
Subject: [PATCH 08/10] memorder: Remove a redundant sentence for memory barrier strength
Date: Sat, 23 Sep 2023 09:32:02 -0700
Message-Id: <20230923163204.14558-9-sj@kernel.org>
In-Reply-To: <20230923163204.14558-1-sj@kernel.org>
References: <20230923163204.14558-1-sj@kernel.org>
List-ID: <perfbook.vger.kernel.org>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>, perfbook@vger.kernel.org

From: SeongJae Park <sj38.park@gmail.com>

A sentence in memorder.tex explains the strength of smp_mb() and its
cost.  Then, a quick quiz having very same answer follows.  Remove the
sentence to reduce the redundancy.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 memorder/memorder.tex | 2 --
 1 file changed, 2 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 5ded6988..bd24b14c 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -1346,8 +1346,6 @@ illustrates this for memory barriers.
 Assuming that both memory barriers are strong enough, if CPU~1's access
 Y1 happens after CPU~0's access Y0, then CPU~1's access X1 is guaranteed
 to happen after CPU~0's access X0.
-When in doubt as to which memory barriers are strong enough, \co{smp_mb()}
-will always do the job, albeit at a price.
 
 \QuickQuiz{
 	How can you tell which memory barriers are strong enough for
-- 
2.17.1

