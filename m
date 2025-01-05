Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1531A184F
	for <perfbook@vger.kernel.org>; Sun,  5 Jan 2025 11:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736075419; cv=none; b=ExNKhS0cHEAbpf9Ze9Zq65/n4X8jrrvuMDEgFQkO3rFcABp7SsD8l/BrZLv3R+Q0B5dCbSGWZ/kmUXrNH/L2X49RcnTeIsv2JISEvkXSqSyKLNt+3AhROCIkHwxVBk1129Apr/ZIgadE/l6IpLTSalY4mVNsm5AIebQ/oP59WMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736075419; c=relaxed/simple;
	bh=ZwiIr5VHhBJa4cUkwb914/gg1rMRg6cZdD+Vl1IqhUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GkLV8sM4b8URVohOVKv+7vTFwwRNzHJSJHVsdYIkGX1C5vlqPwRq3QijtCokG4EMIFoQZufVXyvF8E5TyQ37HX60+vMkRnZ5xlLfPxedsyYN9hCl1IzuDrNeaTnRYqrjTYnYi+c44s/YxaFD2GMd22FsuhA/054ZXVpZUKl80aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijm6rywb; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijm6rywb"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f441904a42so19667064a91.1
        for <perfbook@vger.kernel.org>; Sun, 05 Jan 2025 03:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736075417; x=1736680217; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FgpU2mYTuU/xF1rnUdDg0VdL7szz7/spkfG7yG5oiO8=;
        b=ijm6rywbWGPRclL/JUGezi9iARgYAV3spy9KAT6DXRoBdTEZgfN6ZttMKGa9hqibn6
         j2ljcNne/MaLqF6tTs9SBZf9WH7YDBPVHui6uZjHWksrP7/n4QAUc5QQhpfvRmcqjGKO
         pIlSCULmcoholhtBoY37Y+dOhxicXknteyUVOwDhWksOyxMph4RAs2GStzrbeS85K4b8
         KZZ9c00oJxaegnCDlZS1ZJYoejA0D4sfDZFjwAXvWqTtNkaS1OgXNi+PN3/rjFlJBp5s
         4lWz/LKROrKNOgYQmSOX4KubEI23r0GUUmQJulrqZ4TzK7fj0geltlJQgH4JGEYeVyGT
         aBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736075417; x=1736680217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FgpU2mYTuU/xF1rnUdDg0VdL7szz7/spkfG7yG5oiO8=;
        b=DUstU3nsUI9qxkvut/mh5dV3/NQEPZYLrqoeojuPv29PCND5Ajq0jXc3g1SbmlZZyq
         WGTbAnbNAYwRiGwsTZZXIa5tlIGcwqVkqAWrX099gUS25pS8gmYVr8T+bIXQfwyuYzm9
         j/uIyhNCDRbzZlvv91AkUkUvYr8g1tao8TyhwbRPSgNw4pDBKeNyYkKJP/KjbU6GcrEv
         csGsz6VZ4TBAnZwbK2MXsD/QOZfGzP6CO2aP91xXrG7q1TfBR4oTyGHC2LSj8K7ByV7q
         u1oAHSX+IvbUeEQrITXD93lpknCJ5eQsxQ3/gglSA2I3XWR4S7nw1+5/VQpv724KdM9J
         L/Zg==
X-Gm-Message-State: AOJu0Yx01GBHvIC1qB8hX/TV6RmNAI/ky8U2JTxEEm16KFTJQ3UBv9Yo
	TZzOc4DXTtqxrM9tR2hW4sVnW9VpLZs52V4zQHe/5xZtd2Cq9965
X-Gm-Gg: ASbGnctxGFmmthxj8yN5nGl8UklpyG3MX7w9VyMPOn+YXQ8jZBwA55Del3h3vxl0Vba
	AtQN3Xo3Y3XOQzFwV8eazltb4j2bbxUJ2OzMEZy/g5Ppc0c9rlmppFM9+iTGwpLqntt5uIiWd0G
	7qmdYwQt1fN5lj1GoeEN4hnmoCSkHH5Fvmn4dktlJEfcq+EvEZFa9CdxRhfi/ajUgZ7dTbCPeog
	U/dkQ6KvGZS8qmRHLTLrwZFFLJE+nLBDkLZoowlj2Z5WpXxDJA4x01T08yLmRxRqOk0HfonNayQ
	HYhTLeBvii7LPQFpYuMtQAM=
X-Google-Smtp-Source: AGHT+IE4s/PPovKhbbRu1KiZt/i9TuI2BUfKzQ/BbtsiL9fWIiDFTy+CJxPXl6KPZ27awX9Tm4PuLg==
X-Received: by 2002:a17:90a:e18b:b0:2ee:fdf3:390d with SMTP id 98e67ed59e1d1-2f452edc2cfmr67918384a91.31.1736075417239;
        Sun, 05 Jan 2025 03:10:17 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed52d227sm33485392a91.2.2025.01.05.03.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 03:10:16 -0800 (PST)
Message-ID: <abcf5d21-3836-4bdf-9eff-096721057a64@gmail.com>
Date: Sun, 5 Jan 2025 20:10:17 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/6] CodeSamples/datastruct: Move struct declaration
 from .c to .h
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <bf045b9a-4a09-4c84-9df8-4ec7154144c7@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <bf045b9a-4a09-4c84-9df8-4ec7154144c7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Forward declaration of a struct in .h is insufficient if there is code
that accesses the struct within the .h file depending on optimization
levels.

GCC of Ubuntu 22.04 with -O0 as well as -O3 ends up in these pair of
errors:

    make[1]: Entering directory 'perfbook/CodeSamples/datastruct/Issaquah'
    cc -g -O0 -Wall -o existence_test existence.c existence_test.c -lpthread -lurcu -lurcu-common -lurcu-signal
    In file included from /usr/include/x86_64-linux-gnu/urcu/pointer.h:39,
                     from /usr/include/x86_64-linux-gnu/urcu-pointer.h:1,
                     from /usr/include/x86_64-linux-gnu/urcu/rculist.h:30,
                     from ../../api.h:847,
                     from existence.c:30:
    existence.h: In function ‘existence_exists_relaxed’:
    existence.h:54:32: error: invalid use of undefined type ‘struct existence’
       54 |         struct existence *ep = rcu_dereference(*epp);
          |                                ^~~~~~~~~~~~~~~
    In file included from /usr/include/x86_64-linux-gnu/urcu/pointer.h:39,
                     from /usr/include/x86_64-linux-gnu/urcu-pointer.h:1,
                     from /usr/include/x86_64-linux-gnu/urcu/rculist.h:30,
                     from ../../api.h:847,
                     from existence_test.c:26:
    existence.h: In function ‘existence_exists_relaxed’:
    existence.h:54:32: error: invalid use of undefined type ‘struct existence’
       54 |         struct existence *ep = rcu_dereference(*epp);
          |                                ^~~~~~~~~~~~~~~
    make[1]: *** [Makefile:49: existence_test] Error 1
    make[1]: Leaving directory 'perfbook/CodeSamples/datastruct/Issaquah'

Move the declaration from .c to .h.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/datastruct/Issaquah/existence.c | 6 ------
 CodeSamples/datastruct/Issaquah/existence.h | 7 ++++++-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/CodeSamples/datastruct/Issaquah/existence.c b/CodeSamples/datastruct/Issaquah/existence.c
index 5e9ee70e..2d56a42d 100644
--- a/CodeSamples/datastruct/Issaquah/existence.c
+++ b/CodeSamples/datastruct/Issaquah/existence.c
@@ -37,12 +37,6 @@
 /* Existence-switch array. */
 const int existence_array[4] = { 1, 0, 0, 1 };
 
-/* Existence structure associated with each moving structure. */
-struct existence {
-	const int **existence_switch;
-	int offset;
-};
-
 /* Existence-group structure associated with multi-structure change. */
 struct existence_group {
 	struct existence outgoing;
diff --git a/CodeSamples/datastruct/Issaquah/existence.h b/CodeSamples/datastruct/Issaquah/existence.h
index 881c908f..c39a8d03 100644
--- a/CodeSamples/datastruct/Issaquah/existence.h
+++ b/CodeSamples/datastruct/Issaquah/existence.h
@@ -22,7 +22,12 @@
 #ifndef __EXISTENCE_H
 #define __EXISTENCE_H
 
-struct existence;
+/* Existence structure associated with each moving structure. */
+struct existence {
+	const int **existence_switch;
+	int offset;
+};
+
 struct existence_group;
 
 void existence_wire_call_rcu(void);
-- 
2.34.1


