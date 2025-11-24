Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BEC221FA0
	for <perfbook@vger.kernel.org>; Mon, 24 Nov 2025 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763975981; cv=none; b=IigzsydaWiSKaaPqBOxkO5n2DM9k3md7LMgZFKDHWoeoxluEvCKr5lBpdaoyyi2NDNerR9pDf4wVXhENL3y8ZyWTgzjTo5G8qSqU4kPY621mE2sngFVT3JXt2bVlY3TZxwScAcV3wwixWrab4xzHtFCArbNZJ9XnScxRzHctmH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763975981; c=relaxed/simple;
	bh=XKp3NYGjH0UJAs2yMeR9ZvdF5AI7mvrpqeJsCOK+GPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eLnwL58YynRio/YzeRzw5D3zkiiXPzXJKFERDA1Z4KCgWQCj3pQgB4nsfc22mOtHCxdqXVLP3PWAISa6oB4ecHNblJcfnvjw77HDYiJnHtUse/8LInwYPOdyRIhfIguQFy8u+cWS7nSePKRmWC7asVIKq3SqdrlC1G+SFXI7qa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDt6ZK4q; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDt6ZK4q"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29806bd47b5so24349835ad.3
        for <perfbook@vger.kernel.org>; Mon, 24 Nov 2025 01:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763975979; x=1764580779; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JnbKTkmDoFE8b1sLcv5UV3x+6+QZJWcxqLAF9pSajxA=;
        b=DDt6ZK4qaurhbrT7lmyUh0xFgEIGEbYpyAcWgLScvAD6oO4O9ryOf3fEiwS4DII1Cc
         xt+7Un3XPQ8q4RVfIqWbnWOzoV7t1GoXVuT25XexD/ZDseAg8utKE9I40sThWV1GNYPR
         PRAlfPJQR9WnHuuEnPCx6Plb34g46fnmoBdbCc/yAPdyDPN12stFQ3/Q7zcJpJAZfk4W
         w6wdev/Jb9may4Q7gnxfBNp36Ca4zKbBTr7ZDZvU1cO0Z47yW4LUrdhrC51xFenRbo9p
         WfzW8uGwOr2tS3BgtnaftwJiptPnDoRqQF91CaGHRLbWtFevY714gouH9qHrV5y3tQVu
         GY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763975979; x=1764580779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnbKTkmDoFE8b1sLcv5UV3x+6+QZJWcxqLAF9pSajxA=;
        b=iR0MbsR5aBXDCYk1JpcdUbEbyaKlkk6gqA3q0V4zMgYixd4TcCeGGoAJO5vC6IQKaG
         /jqHFvcv9nrPOS73QhTY2Hv0yjHZiiUER+m9VyTI8dgoLN8ZR50k92nycQaczIeZuNQY
         Y9ikmJ/+TYqh0NT/+H/J2/cz5MvJg29EUlZyleTFSDNYaBVGDznPEPIDzYn/Hwn5AbXJ
         AgiCAtbhWaHoinyzlcxS6OaTqjTDRq1dqkzqdV2XKbREYrTgdJSaLT87pS/e79W1I1u4
         Rx8kWqgDSWIzvG8TzjyffSQf4hngPoabuTNDW/TlDp1kShDr3y9gwU26ANzxBRoWwo1i
         ue8g==
X-Gm-Message-State: AOJu0Yw7XlNGy6LoSqG9MlTuRrULQpv+CMl0IapgEHDRYNEqtCTYtbXV
	aRlYaGwUTPAsM6nrNb15DLJtX/lmvFXjFinRGU/jw65uWvzfnP5CewdLJ7qagQ==
X-Gm-Gg: ASbGncuF1cDvyjhP7ab1by6qSI7Kv0TgWtwPRI5qpgLRcIgFResQDiJKxoYGks93o5Q
	S3Abk8nP45GSPz2+c7/H/h3G2dtXLWVM88gbsjNYl2Fv4I+c1FLVfRsrlHg/r/5kqhz2zt6iC9R
	QclbztwAjUCD/AMQf2SUNLQ2PfTfwRVCcwZXFKcnjOch+Jf+zs1Hsd3R+bi/M+FBR5rpVpwiatc
	FAEpk4AttyyQC582zWuenOH2ipWB6Eu9pVuANA1bSAUSsS/g648EyMNB20ZEOZxT1D1xq6CDrpQ
	IqtheSUzbS1UAXVaDX3B06/M49LX0w2kHF7oQrqhcirWhKk9gsCfd8Qtc/yXWUtJvEx+REwx2od
	GVNaYaK2E2y/S2hN0QF614NI/pFrrlp2PfEwVt/5uDEI8+wBIF4WkC44yTXsQG0D6aY4WsqR6Gc
	xcYCKWN7zBUYUS4Z+yOWmqKl4xPrh78bX30lPzyn/jW9z2DKUE/iyOWOvn
X-Google-Smtp-Source: AGHT+IHdD/bVWOjY3SKBStWGXo0of9cl1n/SNexVZMaCUtZoZhPKKmYHm2EVBQ8LxAKNDqGvEcTzLw==
X-Received: by 2002:a17:903:3508:b0:297:dd7f:f1e0 with SMTP id d9443c01a7336-29b6c68dd8fmr107243335ad.43.1763975979413;
        Mon, 24 Nov 2025 01:19:39 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b274752sm129145305ad.75.2025.11.24.01.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 01:19:39 -0800 (PST)
Message-ID: <898de3d7-5db3-4daa-a8c1-e8c0a57aa16e@gmail.com>
Date: Mon, 24 Nov 2025 18:19:38 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 3/3] CodeSamples/formal/herd/Makefile: Exclude
 time-consuming test from run-herd7
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <ceb4f33e-fd07-48f6-88c7-fe9c3ef2db20@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <ceb4f33e-fd07-48f6-88c7-fe9c3ef2db20@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

C-double-check-rcu-4 needs 20 mins or so to complete.
The other tests in "make run-herd7" take a few seconds at most.
Exclude it from run-herd7 and let it be run by a new target:
run-dblcheck4.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/herd/Makefile | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/CodeSamples/formal/herd/Makefile b/CodeSamples/formal/herd/Makefile
index 257ee556..959b8ed7 100644
--- a/CodeSamples/formal/herd/Makefile
+++ b/CodeSamples/formal/herd/Makefile
@@ -7,6 +7,7 @@
 # cross-klitmus7:  Cross-compile transformed litmus tests by klitmus7
 # run-absperf:     Run memory model benchmark tests of absperf
 # run-absperf-all: Run all absperf tests (including those take quite a while)
+# run-dblcheck4:   Run C-double-check-rcu-4 (takes 20 mins or so)
 #
 # Warning: absperf tests take more than 1 hour by default.
 #
@@ -47,7 +48,9 @@ ABSPERF_TEST   := $(wildcard C-SB+l-*.litmus)
 ABSPERF_LONG   := $(wildcard C-SB+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u+l-o-o-u-*.litmus)
 ABSPERF_SHORT  := $(filter-out $(ABSPERF_LONG),$(ABSPERF_TEST))
 ABSPERF_OUT    = absperf.out absperf-all.out
-HERD7_TEST     := $(filter-out $(ABSPERF_TEST),$(HERD7_LITMUS))
+DBL_CHECK_LONG = C-double-check-rcu-4.litmus
+DBL_CHECK_LONG_OUT := $(DBL_CHECK_LONG:%.litmus=%.out)
+HERD7_TEST     := $(filter-out $(ABSPERF_TEST) $(DBL_CHECK_LONG),$(HERD7_LITMUS))
 HERD7_OUT      := $(HERD7_TEST:%.litmus=%.out)
 KLITMUS_READY = \
     C-Lock1 C-Lock2 \
@@ -61,7 +64,7 @@ KLITMUS_READY = \
 KLITMUS_TEST   := $(addsuffix .litmus,$(KLITMUS_READY))
 
 .PHONY: all clean litmus2herd run-herd7 run-absperf run-absperf-all cross-klitmus
-.PHONY: help
+.PHONY: run-dblcheck4 help
 
 all: litmus2herd
 
@@ -73,6 +76,7 @@ $(LITMUS7_HERD_TEST): %.herd: ../litmus/%
 run-herd7: $(LITMUS7_HERD_OUT) $(HERD7_OUT)
 run-absperf: absperf.out
 run-absperf-all: absperf-all.out
+run-dblcheck4: $(DBL_CHECK_LONG_OUT)
 
 $(LKMM_LIST):
 	@echo "#####################################################"
@@ -89,7 +93,7 @@ $(LITMUS7_HERD_OUT) $(ABSPERF_OUT) $(HERD7_OUT): $(LKMM_LIST)
 $(LITMUS7_HERD_OUT): %.out: %.herd
 	cd $(LKMM_DIR); herd7 -conf linux-kernel.cfg $(HERD_DIR)/$< > $(HERD_DIR)/$@
 
-$(HERD7_OUT): %.out: %.litmus
+$(HERD7_OUT) $(DBL_CHECK_LONG_OUT): %.out: %.litmus
 	cd $(LKMM_DIR); herd7 -conf linux-kernel.cfg $(HERD_DIR)/$< > $(HERD_DIR)/$@
 
 absperf.out: ABSPERF_LIST = $(ABSPERF_SHORT)
@@ -122,6 +126,7 @@ help:
 	@echo "    cross-klitmus7:  Cross-compile transformed litmus tests by klitmus7"
 	@echo "    run-absperf:     Run memory model benchmark tests of absperf"
 	@echo "    run-absperf-all: Run all absperf tests (including those take quite a while)"
+	@echo "    run-dblcheck4:   Run C-double-check-rcu-4 (takes 20 mins or so)"
 	@echo
 	@echo "Warning: absperf tests require more than 1 hour by default."
 	@echo "    Refer to comment in Makefile for instructions to override default setting."
-- 
2.43.0


