Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01655189F5C
	for <perfbook@vger.kernel.org>; Mon,  6 Jan 2025 03:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736132407; cv=none; b=eWwajPgFqVBnskZQhgSGeQMQHHYhyE/4vWOg9V7ch+tuz/N/lQEv/mVhMWTptCESCQcy6gQidT5CJt9eCtORiMfJQ1Pz27+TYiv/XKFewIQCmD+m/vvdz3s5qAVBn1oAEz8LtR+Ii2ry3SwuD0FXrM7VzMx2sghP5UAqhsPQKhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736132407; c=relaxed/simple;
	bh=xNibWdrzhHYN1oyH/INEGZFvyS8ynB/wHSBm6Fqj2Mk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ShyyebcpX3YPVviHpF5nPkTahvKzOYkpDR3SeIi0kctTX+JbWENs8fdK/D0mO2ZzyYg4OftVPxrBb2Lwjc6kZHJPaZECbDlp/5lfvAKDyxFwoXPhFWtf9h080RLsPjeRkx4X9m1lvD/PdMsp442/GktS/TB447i01uWRhdnpIoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGom20tg; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGom20tg"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so15897516a91.2
        for <perfbook@vger.kernel.org>; Sun, 05 Jan 2025 19:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736132405; x=1736737205; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDdkEL1xdwTOpfQKxC63zH6WCMgZcTSaFdM0f/Yn8gs=;
        b=eGom20tgtO/XNUi18CWDejUvAjOMrj2l1H+hXzEHGNEXU4GoAh/ShhzKmo7QwZQp+j
         Cz8uhluiuf8/MRy+P9cJE8xYAL7wuO3BB+FD/+/Dqe7TW1+Yg5xXty9i48DUsB052VXa
         vopHFbgQAkz/fZKMHnQgh/wzuB5n/ulyF19Q7Q+Pj6hrVaVw59xeTuja1SQUXmoLNnBR
         cP1aK4/G+Z/4eDokMsekV0S9tH9/kUk1nHO4ujxyM07YP8cvFtjaa7ykqJPcLI34oWkB
         hsxVRoPIFCTg7ONUqqFfGNWrOAj+2L/JpwwAdrg/QsWWlIwfbIwNg7QwjYs7Kwlv073Z
         D7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736132405; x=1736737205;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bDdkEL1xdwTOpfQKxC63zH6WCMgZcTSaFdM0f/Yn8gs=;
        b=WQiaMiwLuWRo/RNxaWbVAPQyJb4vuVGumFv/qShnZaMm1P/FeDBiTwnxVEAQR0hocw
         /HCn9EFSHqogjelKuA/O+5YEhye88cpvoJfsgTP0DVQbK0YcVqA24s2eNV78RUcbVnk1
         swd78zS66TRCSLfYDrksU6knyA+w+Jchdqi8cky3I7XeYLm09xaKyj2evQREI7J/Rt0u
         GhGdZjFcEVtUDCFYIUjwbLLpvn3/17sSkbQnnVHeh8LDA/Sm3zqXi+qKt6GZif2Po+Io
         MeIg9+TgJmVjFB176R5obUdkCqXOBkLhVQD9q5v3CltCKArWZaGfNB4bE5oWZXqg/xWi
         9M1Q==
X-Gm-Message-State: AOJu0Yx45k6cP2waXnQ7DiKdxqzQROgTjecK5g0F1iPm+Je6T7TGLCre
	dzZUBa38z36qKtsD9LmH6YcwFYX66irPvC6ZP9Y36qtxWkL9rUd0OEPE/g==
X-Gm-Gg: ASbGncviYYlacuUVM0WnDiIKNP2OeQ/Nl8hGJz7dB8nmgLKHay32IzUYwTcR88FT15B
	QNnRiJcvEdoSmPtGPcgSylDGjAoEzMRwxMypFBAxOhAcUsvYp0n0Z8G4ZDMf5vmAdYPnQWfhRpe
	fW9CPTonLfzmu9n8E8fbcfirelKNKYDxVn0Epau2aYb1zoDUsWAURHFxDqABRHRqXo3gsQSlv2k
	ozzTfOYj8qtR/EGDEU9QHJjR3WusOgLjO9agaTf5XHbDgZOMFhPrYh/fMWWGjtc1dHcBUhLddSR
	DUgCXJ9kNBFfx/zqGc7DVDU=
X-Google-Smtp-Source: AGHT+IEwZQ26/l/EAfGJP2TAox3IiWfRh8vZIoEejEVg4baObwddCPJnDcH186jOHhRqFXeqa3mTiQ==
X-Received: by 2002:a17:90b:2745:b0:2ee:c5ea:bd91 with SMTP id 98e67ed59e1d1-2f452ec6d2amr86724014a91.29.1736132405235;
        Sun, 05 Jan 2025 19:00:05 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed52cdc3sm34391755a91.3.2025.01.05.19.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 19:00:04 -0800 (PST)
Message-ID: <1034fb7b-b566-4189-9353-edc39782c9aa@gmail.com>
Date: Mon, 6 Jan 2025 12:00:02 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook] Revert "CodeSamples: Add -fcommon to GCC_ARGS"
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This reverts commit c1f3367e5701333dd9c2bdd629754d5278b66d2a.

Commit ca0fdef62907 ("CodeSamples: Add #ifndef SUBOBJ to api-pthreads.h")
resolved root cause of build failures that commit c1f3367e5701 had worked
around.

The band-aid fix can be reverted now.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/datastruct/Issaquah/Makefile | 1 -
 CodeSamples/datastruct/hash/Makefile     | 1 -
 CodeSamples/defer/Makefile               | 1 -
 3 files changed, 3 deletions(-)

diff --git a/CodeSamples/datastruct/Issaquah/Makefile b/CodeSamples/datastruct/Issaquah/Makefile
index ca379b3e..d3a5fcb2 100644
--- a/CodeSamples/datastruct/Issaquah/Makefile
+++ b/CodeSamples/datastruct/Issaquah/Makefile
@@ -32,7 +32,6 @@ endif
 
 include $(top)/recipes.mk
 
-GCC_ARGS += -fcommon
 LURCU_SIG := $(shell pkg-config --libs liburcu-signal 2>/dev/null)
 
 # NOTE:  For decent scalability on update-side tests as of early 2015,
diff --git a/CodeSamples/datastruct/hash/Makefile b/CodeSamples/datastruct/hash/Makefile
index 5f3d740c..a84499eb 100644
--- a/CodeSamples/datastruct/hash/Makefile
+++ b/CodeSamples/datastruct/hash/Makefile
@@ -32,7 +32,6 @@ endif
 
 include $(top)/recipes.mk
 
-GCC_ARGS += -fcommon
 LURCU_SIG := $(shell pkg-config --libs liburcu-signal 2>/dev/null)
 
 hash_bkt: hash_bkt.c ../../api.h hashtorture.h
diff --git a/CodeSamples/defer/Makefile b/CodeSamples/defer/Makefile
index 0cb77122..69516958 100644
--- a/CodeSamples/defer/Makefile
+++ b/CodeSamples/defer/Makefile
@@ -61,7 +61,6 @@ endif
 
 include $(top)/recipes.mk
 
-GCC_ARGS += -fcommon
 LURCU_SIG := $(shell pkg-config --libs liburcu-signal 2>/dev/null)
 
 # Note that bug_srcu_a is disabled until completed.

base-commit: 6081ef4580d7495727eeb87beb93b3b0dedf0139
-- 
2.34.1

