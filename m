Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83085C614
	for <perfbook@vger.kernel.org>; Sun, 11 Feb 2024 17:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707674039; cv=none; b=NgP6it6Zr26ovLCDNEiSdllDbLaTNJG5St6yvXV+RSlN3A4zCG1AzAS0ZZK9uEy5qxDBEgApAf1iijXtDGZ1S4q/PkEn7sOonHIzKEMu2CH6Ljc/HoDyYxcm3QSlB9Z14OMKYa1zdmGMxy14upV/qqVZXmsO3dPQhkf8dM6LUGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707674039; c=relaxed/simple;
	bh=Y491c5+SH+auUuolIDNpyx5I0xBc+zuI+M7QGH1zxLY=;
	h=From:To:Cc:Subject:Date:Message-Id; b=rPLpBe/tdZ7ix/m40uR8aAK4dKKKMz8BVChWkYPpP1RaAOvDTCWMnr9lXHoPYVgRVuFS/OA5oEIrk6kA0Xw+nGPgQtD09SEgbICZlzAqB8gdN8azCNReCwf9xvrkcPxE/GNk0CBSd0IsVJlRLyZyv5NKR050+dDnqODg0EzFLUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enWw2G6T; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enWw2G6T"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6da6b0eb2d4so1897052b3a.1
        for <perfbook@vger.kernel.org>; Sun, 11 Feb 2024 09:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707674037; x=1708278837; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBZXGmWhKqKmUtAeWPraqVCwNR3Vaqn/q/Lo9O31sbg=;
        b=enWw2G6T+TC44b4GVvlJ61x6g0O1F0M7KZAcUrm0cvyv0BvBwob7jP0G6585ILHzvD
         /3RtqLXSxCp+68lzNl0NU8LDZ5FexnIbDY+Ne3gqDjaZS8wSup3938wFDf/zS28z1VBj
         Rf0JvCkynsGdQDawk+KGcdlG8H17ODN0Fe3Qkz0DHhSsjw8V96alG2pmDpwpjwst/D50
         jWChcJZvdtVy5h3aV8oe5n32HWhJdUczCDmZ+mviFh9KVwYtEUrT84lDzh+y5jOBDrAB
         Ll0EJi5T+UkXui5GqZSuDRLJhDb0MiBdnunWbsbFSfl5eNCTaYMBgMn0qvtcdbY79fOx
         JjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707674037; x=1708278837;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBZXGmWhKqKmUtAeWPraqVCwNR3Vaqn/q/Lo9O31sbg=;
        b=PmRHnkTnyElFd4HMAomNhdEUJCSe9FaBHv4XdtiysvXVTQEKAB9yI3B1Uz+dW20D/u
         Gd9XRLSPFMDbtTznACh+DStQciFxxVFCfm/gaySugEFDEKmmhepK2pWqdjYrXRzERhgx
         pEhMPV6RktQJxy1oOROhPKrgvu5MiQ6RIWku+f0MymQ8qMEwNekc3mzZpqfNjrG+T4qp
         i8TYrsJzVZ237kcodQS+XDRKSHZYoJT7u3EQHibMG+cWHJjD72ud/uSKDL8cNADoZ8cU
         rEEuPObc+ZZzfkRBJttgML4qaIfb0qrmWW2URTn6hMDSTQLxspO4AN8ASaOogDXnWf/4
         qvSg==
X-Gm-Message-State: AOJu0YxYofRji1YUJxdSrVjFD/gd1faG5UsLyWyeeX9x3dL0HmU+AOLv
	qVGHc1L4ZV5mXTJ1NU59GC3Vsb3/zrY3dokeQt9FMu9I/JDAgOAYuuFyj01z
X-Google-Smtp-Source: AGHT+IEGD11z5KnfCyUkiMGPW1qRxyzJzMIPK31a9JwXzBHWvWeg0OI2kWxcu3Pxs+XnOPRQY9vb1g==
X-Received: by 2002:a05:6a20:6f07:b0:19c:8d73:7212 with SMTP id gt7-20020a056a206f0700b0019c8d737212mr4287706pzb.13.1707674037162;
        Sun, 11 Feb 2024 09:53:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUh+gLezoBd19dsKimI9Vvdox4F6ShZ6QurMzIlhISo1isDLx0TRkefDCwPbzTwxL9Mu4FhCqfCLIxXSOjHO/hnz68MidTPtiA=
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902eac400b001d9630e3396sm4553455pld.193.2024.02.11.09.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 09:53:56 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>,
	perfbook@vger.kernel.org
Subject: [PATCH] FAQ: Update Korean translation progress
Date: Sun, 11 Feb 2024 09:53:54 -0800
Message-Id: <20240211175355.4986-1-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

I started the translation of perfbook since October 2015.  The
translation was done by June 2017, and I continued wordsmithing, merging
the upstream changes, and further translating.  Following the upstream's
fast speed of the change and keeping the translation consistent was
quite challenging.

In Mar 2021, I therefore decided to stop updating existing translation
and start the translation of the 2nd edition from the scratch.  Applying
upstream changes were minimized to only simple fixes, usually what I
fixed on my local repo first and sent patches upstream.

After about three years, I just completed the Korean translation of the
2nd edition.  Hence updating the Korean translation progress on FAQ.

It was a very fun and informative journey.  Huge appreciate to Paul and
the community for making the great book and letting me get the fun.

I have no plan for the future.  I don't know if I will continue merging
upstream changes and further translating it, or if I will restart the
translation after the third edition is released.  I sometimes feel
translation is already an area that AI can do better than me.  But I
sure I would repeatedly read this book again and again, and some day, I
might try to translate it again.  But at the moment, I'd like to take a
time to congrats myself :)

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 FAQ.txt | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/FAQ.txt b/FAQ.txt
index eb242a36..9e0021f9 100644
--- a/FAQ.txt
+++ b/FAQ.txt
@@ -136,10 +136,15 @@
 
 		https://sites.google.com/view/kandamotohiro2/perfbook
 
-		SeongJae Park has started work on a Korean translation:
+		SeongJae Park has Korean translations of the first two editions
+		of this book.  The translation of the first edition contains
+		some of later-first edition changes, though[*]:
 
 		https://github.com/sjp38/perfbook-ko_KR
 
+		[*] Refer to 'Translation Strategy and Editions' section of
+		https://github.com/sjp38/perfbook-ko_KR-pdf/blob/master/README
+
 7.	I am working on a translation.  What do I need to do to get my
 	name of the list in #6 above?
 
-- 
2.17.1

