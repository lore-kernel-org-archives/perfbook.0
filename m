Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327EF15278E
	for <perfbook@vger.kernel.org>; Sun, 19 Oct 2025 08:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760861735; cv=none; b=Y3vdnUnhT6XfK75jIJY3U7E0CIOrAgDAeuOghTNe+NRELq9edIAVcyJYEPSTRDcnSm64EY5nXWybnHiCOdoEOJLhz/39Wg6QofzbQLfXPk9RpsvCiWc4ZEI4PouP7VsPBInumAaN+jXio8QaEgTFO0X8r8RVDo+DHfNWw1eh9cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760861735; c=relaxed/simple;
	bh=ue54VZ4W7vhO4l1cc1xtgZBvfGSSjHgSuay0BsLc5ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EH0IwQf8JsWnmQXicDMvVMUxxsrNstjxYa1v+HfTMa19lGncFbF1remNPvooyLuTz849VHtgGk47EaRYyGTB9zsdgap6QKj1rPBVgYoLO5iAapE7tB9div/qQntnfSC+pKdru+Yxzk0TMJBhEyoFoFY9iAwb/MSInDVmZyNdbzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqZMfzcR; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqZMfzcR"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-290dc63fabbso20245295ad.0
        for <perfbook@vger.kernel.org>; Sun, 19 Oct 2025 01:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760861733; x=1761466533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ytt9T2wcnAeCMEs857gI9P47QqCQ8gCZStNT6cZ5mjw=;
        b=DqZMfzcRAcOpIlZCobwYbO/Uc7LfKoZvlnSkmM6VpVOvm5bLDXi1yPkB9F88jOPAeN
         28gySKvVmHzz6wLR9aJPyQvnPhWHPPy+3qZF/9MwtAkeLGsv2iSWG1oMyquAJeEwmLiI
         JhFwUc12Fyy6kaQ+0k+qJJvKrgZZ0J+PE51fXILE0cv3rsJBMfUkFjygRdGhBYzUbKeu
         kjB4rnfkpfbdY61/PQaQKzBimmbkEwsUn8YVD/ZAZZh27SAarSCFTluyUl5y3TjdKH5M
         TI4AGlwxKkE4JQdDnLHv5RsMukIJJ1c8VTs0V6ghvXUu0vEQUye8iIQ7Hc9sz/417SiG
         uLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760861733; x=1761466533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ytt9T2wcnAeCMEs857gI9P47QqCQ8gCZStNT6cZ5mjw=;
        b=oHtJPTRDXI3UbnbbwxqEfodlmmi1KZG+j3Y6ob2X9EauzvN5HkwhdqZsQ7y/Sg5Kt7
         3xI4Fu8xW519q0jJoqZWS9S2DzQlh1jFyZcQ0uIS/5iakZay/qPIV7P13RW+IlSAc5pU
         PIxaV39kHxwtiskO8UFkW2ZA8lZA9Fe7HhfDsFU51PzUvL4pJDsYhZUBkN2mA78/8mNi
         YYa/ThYHy4SPD7jK5k2UA84ymX+Vw6m1wrKoiPP9nNRTU5oCoz+A5e26fbhGdMcr9KrZ
         v6OideRhspRfaOMsImjNihk+xZlkEZw2YxLoXOthm5/6BcqahC3ZPbuc3kgdB7ph65f8
         1oRA==
X-Gm-Message-State: AOJu0Yy9WNF7Uv8QdOXwJY3m/DYcsC/80p1NNd9lC5NxVt/2uxpPUYUc
	RU/XqzYW44h8ya+AHJdYK4tUX6GGAA3vKcLLJ/o5Z05CEmXqXGHBfTkJ
X-Gm-Gg: ASbGnctrQqXh6zRRn05flc33ZlmUlzNI9WozDepaeHRdes6ZYNYOLTO+7mVB7Tl5M6B
	cJjaAeLUddNP/BmdFIrcetwjtqO574/S6e9eEsz+0JnMYSeNZvfbW5MTC2Mivk/dysQGcmH1do4
	pyxuWTwGSpUe1oatvj5XbmR8TxciWOFlYbnSI1HB9iW7TtZW+yjU3ZYUcA8rZRon3y/VmZIAuHB
	8GY1el4CcMnbGJfpaAzdTgKAzwoBYXSD1hJ+yJAHKtazepHHSPcaqF17A+TG5de12LULFoBNfDY
	WZXmPnKh38IrnHcVRqANDfhVB5WzfLmPj/Rxh+oVPSjTxaXmGBnA1ty/JXJmUYIsleA00mPuvqH
	0ryGN0VkDg9egf4Yzk0HRJ0RpcdyTS4PEIhZE3npMlsiNKky0fWUipIG1kEv+l2R4nq9+o5TN4o
	c+q5AzlCu42M1sGsBfW4CDSPy9c7Td7PaGVaFv3pMy6HFAnA==
X-Google-Smtp-Source: AGHT+IGe406rpP/my0b2a5TvElefXbQLA0yKcGOp47hQeMgm18bTXxsLhTOKpgv5nTlmuN8PCHMM9g==
X-Received: by 2002:a17:902:f610:b0:272:dee1:c137 with SMTP id d9443c01a7336-290c9ca6b34mr122105735ad.13.1760861733357;
        Sun, 19 Oct 2025 01:15:33 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fea2c4sm46426535ad.48.2025.10.19.01.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 01:15:33 -0700 (PDT)
Message-ID: <9e8ae462-9265-47c9-a1c7-e258055e9f97@gmail.com>
Date: Sun, 19 Oct 2025 17:15:31 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 1/2] Revert "runlatex.sh: Detect fvextra versions
 with known minor regression"
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <f3241d2d-833e-4ce8-9fc5-d23a42f5a8c5@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <f3241d2d-833e-4ce8-9fc5-d23a42f5a8c5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This reverts commit cd98035a31bcefff91d221aa25df2b7b98da243d.

Rather than asking manual install of fvextra < v1.11.0 or > v1.13.2,
next patch applies the (tentative) fix on-the-fly when buggy
fvextra is detected.

Let's revert the first attempt.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 utilities/runlatex.sh | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index d5b1844d..17d833ad 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -169,22 +169,6 @@ then
 	echo "### Consider upgrading to Ubuntu 20.04 LTS or later.     ###"
 	echo "############################################################"
 fi
-# fvextra version check (Ubuntu 25.04 and 25.10 have buggy one
-FVEXTRA_VER=`grep -E -e 'fvextra .* v[0-9\.]+' $basename.log | \
-		sed -e 's/.* \(v.*\) fv.*/\1/'`
-#echo $FVEXTRA_VER
-FVEXTRA_BUGGY_SINCE=v1.11.0
-FVEXTRA_BUGGY_UNTIL=v1.13.2
-
-fvextra_since=`env printf "$FVEXTRA_BUGGY_SINCE\n$FVEXTRA_VER" | sort -V | head -n 1`
-fvextra_until=`env printf "$FVEXTRA_BUGGY_UNTIL\n$FVEXTRA_VER" | sort -V | tail -n 1`
-
-if [ $fvextra_since = $FVEXTRA_BUGGY_SINCE -a $fvextra_until = $FVEXTRA_BUGGY_UNTIL ] ; then
-	echo "Buggy fvextra $FVEXTRA_VER detected."
-	echo "It causes undesirable page/column breaks in short code snippets."
-	echo "Consider installing fvextra < $FVEXTRA_BUGGY_SINCE or > $FVEXTRA_BUGGY_UNTIL."
-fi
-
 # to avoid redundant run of bibtex and pdflatex
 touch $basename.bbl
 touch $basename.pdf
-- 
2.43.0


