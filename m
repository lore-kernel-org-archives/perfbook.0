Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBDB2BB15
	for <perfbook@vger.kernel.org>; Sun,  6 Apr 2025 10:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743935663; cv=none; b=kVXVietq80omVmkpZ6qJCCUlSlO8u7qZHE2ThJb7OOqnkqcmD+M1K2eZofkV/FWTiPu4i2lrQ9ErFToibRFf1aVHEpf3f0TI7Qixuk1xgDV7P9na4yBWpqyzOAOAfbdFzzdYquNAnFeLnZxt+obkUKlv5lXYkAhXHJ5da8IeoXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743935663; c=relaxed/simple;
	bh=qTleDjERcNafVHzikYYwozP3SjQJrUzd7hxaI31KW8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gxGTT0GpmZHnaw0gXZ2Qm37uo9IudBsx37ylvNm6aVwGzYQD6UFLeFD9k6CvLVkQvkgOas+YoZ7Rn+UHpkfYmc3Dyix0j3KJ7LAyTPVPYUOfYzx9MhqCETXC2g/KoF92OCJxKrd9eMzRMUFZ5psGxUGCEnEsK+OYL8Hn0Dh2Cfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPqcqIdG; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPqcqIdG"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736b350a22cso2850808b3a.1
        for <perfbook@vger.kernel.org>; Sun, 06 Apr 2025 03:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743935661; x=1744540461; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FHD2GeONt1CqNSES8TZUW8UuuQF+IGbR7ua0T5NvvsY=;
        b=CPqcqIdG0YMn0L8f9XgHl4snCxCzPlr51SahlZPM9BwlZfqL9hAx7tvPE4yMgOmhfV
         wiDkBa4UdAhBr2J/w8bdS5OS4gblJCkWoVm6AGyfZ2OBIbdtuWCjItKyk0WVMG1Kien3
         Fo5Icf7eFYmqKgUsfZDrcebUFhYtW/WHTv+9bCbwVzB0ih7Z7nDr6pP5tsR4G7+dC1hk
         qRo/QN2a/dYT/9UVNm/mBt8S3DOQqq8wzsgzhE1j0KLMWaTDMeNNlmHpIV2g4ujU1Oj1
         7rgw+XLHBytHlOcB2PMU6x+KPFsl0hIiGBXXmxLn3rqc1GJr9yPDu22DccrQtQEQuC5U
         tpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743935661; x=1744540461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FHD2GeONt1CqNSES8TZUW8UuuQF+IGbR7ua0T5NvvsY=;
        b=P97hhqeoMz7s+hmH7BByImP3eFgfss5Gzm9XoRU6vhX9L3YSDQjVmF/prAeWOpTXjw
         bzgZlG2+cuIxUOM4mYjEbHrqYn8c/BLTQxcgGDWml46yuixytU9AHTn0te8dNQYmh4+O
         yJRvLIlYWuw0zFlLNT3XuNDG5Mg86MK++oRPRKwl9rV54Ik5GyC7jO9LWleo0f4G3237
         qyAyX2bAu/MkhNXUrqHdeKg50fhr4e0+A77m8GfkSbXBJYQWO6A2slcsRQkZP+50+Hq1
         +6kcFMx7ooghcfk09z6h0IT8m0EFDaH7nB9xTo5jYnpiTA9FbitsIxBCKDWxtX1F3iSa
         R/VQ==
X-Gm-Message-State: AOJu0Yw+hklh14Jco0E2pJt9cZS3fM+RDyg3azKvfcrddAc5pLB1NWQj
	Rp3ITkSrRRy3rJLehjPtI8wB5NX+xN4nP4wwUXYsfXVLHStk5mnH
X-Gm-Gg: ASbGncuBAII11JQ2H5v+48oyUOCs30g9n+l1UojPNFPyPRDdi3FbCGpeezPm8t0AaG5
	tZ0hD/bARwZ6jgozR6/su1Lc1VoeT7r0NMRpNYlgdKKF73SQ2UCbKEsK1EPu+o4Qbud8L37g7H+
	MdpbDruFw2LrHct0/fP0v9A22fb5LBwpV3GRyHjwxjZF0D6zlsudbzda1jZe37pYSH5to2R2pJy
	3yuLznL4dZxD8lcAduOkwkwiNn3Xr6O93NUrD/NMYTwWGQcAjyRNPsU7vPucYCUXX99VrCVjGJ2
	yIzIdvS/KuHv8Yj1y697+mXd93I0riQKObAlgjnraG0i8A+8nooUC9NbuT6OWrpTgrzQA1fjDS0
	H1lY7Rm10WZaQgm9lqCA1qQ18Pg==
X-Google-Smtp-Source: AGHT+IHQE6WS9l79ZzaVOBelRTIhC3feSbGMnqXGQfikjvwtWVZ5TMk4kcrbGGp/Gq/GNYdMKUE8XA==
X-Received: by 2002:a05:6a00:1a89:b0:736:a540:c9b5 with SMTP id d2e1a72fcca58-739e4c12eccmr12077568b3a.22.1743935660757;
        Sun, 06 Apr 2025 03:34:20 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0dea7esm6437186b3a.161.2025.04.06.03.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 03:34:20 -0700 (PDT)
Message-ID: <8b4212d9-eab7-4d33-9b68-353b134b7bf4@gmail.com>
Date: Sun, 6 Apr 2025 19:34:18 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 3/3] memorder: Add index markers for "multicopy
 atomicity"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <59063d68-a13d-469b-aac8-635f2423fdd2@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <59063d68-a13d-469b-aac8-635f2423fdd2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Notes:
 1.  "other-multicopy atomicity" and "non-multicopy atomicity" want
     macros with alternative forms such as
     \IXalth{other-multicopy atomicity}{other-}{multicopy atomicity},
     so that they don't have extra spaces after "other-" and "non-" in
     the printed text.

 2.  Several instances of "multicopy atomic" and friends are also marked
     for "multicopy atomicity".

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 memorder/memorder.tex | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/memorder/memorder.tex b/memorder/memorder.tex
index 46261137..1a367509 100644
--- a/memorder/memorder.tex
+++ b/memorder/memorder.tex
@@ -2273,7 +2273,7 @@ accommodate only one store at a time, then any pair of CPUs would
 agree on the order of all stores that they observed.
 Unfortunately, building a computer system as shown in the figure, without
 store buffers or even caches, would result in glacially slow computation.
-Most CPU vendors interested in providing multicopy atomicity therefore
+Most CPU vendors interested in providing \IXB{multicopy atomicity} therefore
 instead provide the slightly weaker
 \emph{other-multicopy atomicity}~\cite[Section B2.3]{ARMv8A:2017},
 which excludes the CPU doing a given store from the requirement that all
@@ -2287,7 +2287,7 @@ CPUs agree on the order of all stores.\footnote{
 	\cpageref{tab:memorder:Summary of Memory Ordering}.}
 This means that if only a subset of CPUs are doing stores, the
 other CPUs will agree on the order of stores, hence the ``other''
-in ``other-multicopy atomicity''.
+in ``\IXBalth{other-multicopy atomicity}{other-}{multicopy atomicity}''.
 Unlike multicopy-atomic platforms, within other-multicopy-atomic platforms,
 the CPU doing the store is permitted to observe its
 store early, which allows its later loads to obtain the newly stored
@@ -2332,8 +2332,8 @@ value directly from the store buffer, which improves performance.
 
 Perhaps there will come a day when all platforms provide some flavor
 of multi-copy atomicity, but
-in the meantime, non-multicopy-atomic platforms do exist, and so software
-must deal with them.
+in the meantime, \IXalth{non-multicopy-atomic}{non-}{multicopy atomicity}
+platforms do exist, and so software must deal with them.
 
 \begin{listing}
 \input{CodeSamples/formal/litmus/C-WRC+o+o-data-o+o-rmb-o@whole.fcv}
@@ -3447,7 +3447,9 @@ bottom, confirming that this counter-intuitive really can happen.
 If you wish, you can click on ``Undo'' to explore other options or
 click on ``Reset'' to start over.
 It can be very helpful to carry out these steps in different orders
-to better understand how a non-multicopy-atomic architecture operates.
+to better understand how a
+\IXalth{non-multicopy-atomic}{non-}{multicopy atomicity}
+architecture operates.
 
 \QuickQuiz{
 	What happens if that \co{lwsync} instruction is instead a
@@ -5364,11 +5366,13 @@ sequential consistency.
 Performance considerations have dictated that no modern mainstream
 system is sequentially consistent.
 
-The next three rows cover multicopy atomicity, which was defined in
+The next three rows cover \IX{multicopy atomicity}, which was defined in
 \cref{sec:memorder:Multicopy Atomicity}.
-The first is full-up (and rare) multicopy atomicity, the second is the
-weaker other-multicopy atomicity, and the third is the weakest
-non-multicopy atomicity.
+The first is full-up (and rare)
+\IXalth{multicopy atomicity}{full}{multicopy atomicity}, the second is the
+weaker \IXalth{other-multicopy atomicity}{other-}{multicopy atomicity},
+and the third is the weakest
+\IXalth{non-multicopy atomicity}{non-}{multicopy atomicity}.
 
 The next row, ``Non-Cache Coherent'', covers accesses from multiple
 threads to a single variable, which was discussed in
@@ -6071,7 +6075,7 @@ instructions~\cite{PowerPC94,MichaelLyons05a}:
 	order of these stores.
 	Not so on PowerPC, even with an \co{lwsync} instruction between each
 	pair of memory-reference instructions, because PowerPC is
-	non-multicopy atomic.
+	\IXalth{non-multicopy atomic}{non-}{multicopy atomicity}.
 \item	[\tco{eieio}] (enforce in-order execution of I/O, in case you
 	were wondering) causes all preceding cacheable stores to appear
 	to have completed before all subsequent stores.
@@ -6233,7 +6237,8 @@ own stores as having happened earlier than this total global order
 would indicate.
 This exception to the total ordering is needed to allow important
 hardware optimizations involving store buffers.
-In addition, x86 provides other-multicopy atomicity, for example,
+In addition, x86 provides
+\IXalth{other-multicopy atomicity}{other-}{multicopy atomicity}, for example,
 so that if CPU~0 sees a store by CPU~1, then CPU~0 is guaranteed to see
 all stores that CPU~1 saw prior to its store.
 Software may use atomic operations to override these hardware optimizations,
@@ -6287,8 +6292,9 @@ but compiler constraints suffices for both the
 It also has strong memory-ordering semantics, as shown in
 \cref{tab:memorder:Summary of Memory Ordering}.
 In particular, all CPUs will agree on the order of unrelated stores from
-different CPUs, that is, the z~Systems CPU family is fully multicopy
-atomic, and is the only commercially available system with this property.
+different CPUs, that is, the z~Systems CPU family is
+\IXalth{fully multicopy atomic}{full}{multicopy atomicity},
+and is the only commercially available system with this property.
 
 As with most CPUs, the z~Systems architecture does not guarantee a
 cache-coherent instruction stream, hence,
-- 
2.34.1


