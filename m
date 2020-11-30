Return-Path: <SRS0=tTHS=FE=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=GZVQeTvymKDkS5Srmuins92+Mc7YfabQKL33pZc+ZYQ=;
        b=WOkz1efDL9wgRYzplCsnAH+9coLHwgRfr2/kkuncPEPD3ZJ7VBMUhhPNfA9wYMOCs1
         La8PxPVZMINUWJjnooJcitE7oRQnujUNIsLszjbCOlOECGJe5KzXei1bv8pcpDEZia/R
         ASvOzhDwRmH8xzNSWx3oJsv8VMC1VlvtDyUO7obtL7sDjs9Xwz/dM2fA1ZC1OUq1aUoE
         eR/Dx/BG0S1axrGOQIK0vX6U4uf3CKZLL/sCUa79xW2b01/0dTzBsogOW0f+VJxm0kFa
         lCQSrWBQYe6R1HFZ3F2EL4Ik5Q4WaY+FeudZawozo5wPPPcVLxTf6DyYTcj/U5d/slHY
         92cQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook 1/2] Remove empty .eps files under
 CodeSamples/SMPdesign/date/hps.2020.03.30a/
Message-ID: <ee4f6b1e-fd90-819a-5ff8-681d6a2e680c@gmail.com>
Date: Mon, 30 Nov 2020 21:03:06 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From 029206953ee20a24908e0a29c2dd60a785aa9b99 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Mon, 30 Nov 2020 20:11:03 +0900
Subject: [PATCH -perfbook 1/2] Remove empty .eps files under CodeSamples/SMPdesign/date/hps.2020.03.30a/

These files cause errors if "eps to pdf" target list in Makefile is
extended.
As they are empty, they are safe to be removed.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/SMPdesign/data/hps.2020.03.30a/CPUvsEnet.eps   | 0
 CodeSamples/SMPdesign/data/hps.2020.03.30a/clockfreq.eps   | 0
 CodeSamples/SMPdesign/data/hps.2020.03.30a/mipsperbuck.eps | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 delete mode 100644 CodeSamples/SMPdesign/data/hps.2020.03.30a/CPUvsEnet.eps
 delete mode 100644 CodeSamples/SMPdesign/data/hps.2020.03.30a/clockfreq.eps
 delete mode 100644 CodeSamples/SMPdesign/data/hps.2020.03.30a/mipsperbuck.eps

diff --git a/CodeSamples/SMPdesign/data/hps.2020.03.30a/CPUvsEnet.eps b/CodeSamples/SMPdesign/data/hps.2020.03.30a/CPUvsEnet.eps
deleted file mode 100644
index e69de29b..00000000
diff --git a/CodeSamples/SMPdesign/data/hps.2020.03.30a/clockfreq.eps b/CodeSamples/SMPdesign/data/hps.2020.03.30a/clockfreq.eps
deleted file mode 100644
index e69de29b..00000000
diff --git a/CodeSamples/SMPdesign/data/hps.2020.03.30a/mipsperbuck.eps b/CodeSamples/SMPdesign/data/hps.2020.03.30a/mipsperbuck.eps
deleted file mode 100644
index e69de29b..00000000
-- 
2.17.1

