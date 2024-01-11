Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658703B198
	for <perfbook@vger.kernel.org>; Thu, 11 Jan 2024 14:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBR6TjW8"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d54b765414so30334575ad.0
        for <perfbook@vger.kernel.org>; Thu, 11 Jan 2024 06:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704981963; x=1705586763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CGWOocBuIBisEOdk3zSwivr+lpSdBK2cRKOzghKWb/I=;
        b=hBR6TjW8k54kSqK0DbzWYNmi4dpzrEZgKN3se4ul5ir88u6Zs6r3HfZlPb0Te0o+bB
         WonjCs9u9O41NWtv99W5za2bm6Qr7CpOFTHY+mCNlBzhPPewz3bgBbR/1CUKeTKjynt/
         k7jZwXJqxHzr1vakWrSOBRykBu4AYyjsUoEkW2R41jqJeAdjBOXF4IJS97L2J51Q6por
         Q4V3IT6sHCNbKxkQy2qddBpcshMaO0a7v+0eDJ14hNlT31MYIr3wRbOyt8treVC++JVe
         ODmadG2Znt58QBUonkI0o/uP8zzuDmJW7sYCL6zmloUbEl9gCG23oUdKFNWypJ1/TIlf
         Tl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704981963; x=1705586763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CGWOocBuIBisEOdk3zSwivr+lpSdBK2cRKOzghKWb/I=;
        b=NczdFBTaqzg6kjiUdjFEq0Q5qtUNL/z6G9Sp9hee92rv7NfLzE+5OyAjJqUhoXF6Ty
         OQmWoRUgSRoDeFclgMnOiPoZc7cx+ZAbUsPKNHi0K9UbzDRzM6CahyyhL0qK8T3B2UU2
         ODzjayKMGawpP+AQy6GF5ikQoEvRHalGs0ZtsXG0AH1SEF1NFGGb9hbHKAf6cpdx2HIk
         uIKS57hHge56WplRxoZiPNQiVQ42J25OmE4EL1kmyYvzvmS/bc7MT4gV+9KXIzXRFwy7
         jUEgT3uxfGcu5MVUIUblkvnpBuBGIxPh8qLxuNpaDIrZZf2SsvaPSYJi47XmsAsXftsC
         Yzbw==
X-Gm-Message-State: AOJu0YwjbqNJ8c58NuZeB51VDAXnqlfw2IqUpSdrka+T+U36Z3JEBdrO
	i3foXc0gcAv+imGsEPpY3QPPqJTQdJg=
X-Google-Smtp-Source: AGHT+IEiPMJViWecWCzfDY6ZTrDb8LMowmb6ql+fTVouhbOF4ge+ylZdcWR9dPEDPduXm7PAKVJpkw==
X-Received: by 2002:a17:902:dacf:b0:1d3:6b17:5eb with SMTP id q15-20020a170902dacf00b001d36b1705ebmr1460351plx.49.1704981962657;
        Thu, 11 Jan 2024 06:06:02 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902edc300b001c71ec1866fsm1196870plk.258.2024.01.11.06.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 06:06:02 -0800 (PST)
Message-ID: <3a2a5a58-1b48-42dd-b315-a6d6a4414a50@gmail.com>
Date: Thu, 11 Jan 2024 23:05:57 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [RFC PATCH -perfbook 2/2] count: Update QQ 5.46
Content-Language: en-US
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Hao Lee <haolee.swjtu@gmail.com>, perfbook@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <20230517120110.GA23586@haolee.io>
 <5961e95e-70c5-7b1a-1e87-cbdf0931161a@gmail.com>
 <20230519062847.GA17791@haolee.io>
 <cab1b46a-a147-ce4c-18c8-0b7b76d675b0@gmail.com>
 <20230521075425.GA13425@haolee.io>
 <71ebc20c-7e07-a029-b576-40782bb77a9d@gmail.com>
 <c518cdae-cc7a-4de0-bfb6-6bfe81434534@gmail.com>
 <ad92d88c-b48d-4a51-8640-4ad13e1271b7@paulmck-laptop>
 <554b2470-8d25-4fbd-9863-b3cdbce1e447@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <554b2470-8d25-4fbd-9863-b3cdbce1e447@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Commit cee469f9a7aa ("api: Switch x86 atomics to gcc C11-like
atomics") changed the definition of atomic_set() as follows:

    #define atomic_set(v, i) \
	__atomic_store_n(&(v)->counter, (i), __ATOMIC_RELAXED)

Previously, it was defined for x86 as follows:

    #define atomic_set(v, i)	(((v)->counter) = (i))

QQ 5.46 assumed the old definition and it can confuse those who have
followed the definition under CodeSamples/.

Reword QQ 5.46 to prevent such confusions.

Add a related QQ asking the need of atomic operation for atomic_set().

Reported-by: Hao Lee <haolee.swjtu@gmail.com>
Link: https://lore.kernel.org/perfbook/20230517120110.GA23586@haolee.io/
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/count/count.tex b/count/count.tex
index c82e7333..e8248b95 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -2257,19 +2257,43 @@ as it is with the \co{count_register_thread()} function starting on
 \clnref{unregister:b}.
 \end{fcvref}
 
-\QuickQuiz{
-	Given that the \co{atomic_set()} primitive does a simple
-	store to the specified \co{atomic_t}, how can
+\QuickQuizSeries{%
+\QuickQuizB{
+	How can
 	\clnrefr{ln:count:count_lim_atomic:utility2:balance:atmcset} of
 	\co{balance_count()} in
 	\cref{lst:count:Atomic Limit Counter Utility Functions 2}
 	work correctly in face of concurrent \co{flush_local_count()}
 	updates to this variable?
-}\QuickQuizAnswer{
-	The caller of both \co{balance_count()} and
+}\QuickQuizAnswerB{
+	It wouldn't work if they were executed concurrently!
+	But no worries.
+	The callers of both \co{balance_count()} and
 	\co{flush_local_count()} hold \co{gblcnt_mutex}, so
 	only one may be executing at a given time.
-}\QuickQuizEnd
+}\QuickQuizEndB
+%
+\QuickQuizE{
+	Does the \co{atomic_set()} primitive in \co{balance_count()}
+	really need to be atomic?
+}\QuickQuizAnswerE{
+	No, it does not.
+ 	As far as the code in question is concerned,
+	the \co{atomic_set()} updates the per-thread variable
+	\co{counterandmax} of its own, whose value can only be updated
+	either from its own thread's fastpaths or from slowpaths of all
+	updaters.
+	As the \co{atomic_set()} is in the slowpath, it can never
+	race with other atomic operations.
+
+	So, even if this code is ported to an ISA where a plain store
+	to an \co{atomic_t} can interfere with atomic read-modify-write
+	operations, a non-atomic \co{atomic_set()} should work.
+
+	That said, such an optimization in slowpaths which is effective
+	only for those peculiar ISAs might not be worth bothering.
+}\QuickQuizEndE
+}			% End of \QuickQuizSeries
 
 The next section qualitatively evaluates this design.
 \ebFloatBarrier
-- 
2.34.1


