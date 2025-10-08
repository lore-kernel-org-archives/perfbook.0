Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30EF21C9FD
	for <perfbook@vger.kernel.org>; Wed,  8 Oct 2025 01:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759885572; cv=none; b=AoGz/uJ2YSCqk2QHmLiO+ysuORXGE9j+ZmB+ZbgkByx6G5r9RvXuuKL+JMus4EUR7uDJFisTvvCW+dY62KB7i9qGsv3bIXGu0K/4FT6mNH8CT97qh0tct1cPuK6EXnvm+IgcX9RPchWxVhKpCATD4QGGu0OMgn9GpIBToTPolKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759885572; c=relaxed/simple;
	bh=ktCTXl6cbCpbgcScOlaTGv8IltRYmOWMnsduuGxs21c=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=eZH3D7xL5UTw65LjQYTHe7nsBGv9lk1XQwVUf6LmsJXOLQSzQNZtbfDieGY3H9uHptpiwWeZ/Bom8A/RtC6LoY65yClGxHNiXiLL/qmepGoR1MbEHTVjxcIACiZtu5YdELCNiVMF0aLSwBnAY8z+kJY/gi3hqMaMmxkkee8aRmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVZPj20j; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVZPj20j"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so5335175b3a.2
        for <perfbook@vger.kernel.org>; Tue, 07 Oct 2025 18:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759885570; x=1760490370; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUJ6n66R9/frzehs+phoBbOvXU1aQ8Z0NpUd/VCbS2U=;
        b=EVZPj20jMxkF6utPly/M9ymrvkTW+qrOOH20481e9x3To/Hvvi9954e/OpiIfsSbrd
         8kcJEKn4kB1PD/rmpNLlu0MTdgntLhNKsbxDWPD5hBrDVQa5My+rAVMPl8sOSUuL5HuR
         sNOHwbRIC8KJIdrTk9uux9ipSXZDC1a8SbbFiPcLP+7w0UxnN4EmJ2UbX8cfikHDzHpm
         4oeWf7YXIxiaU8IwBkqQypdwbh1eIFajZErTuP/+6hw+3SHpnAmsD92sfyacdHjlyXtN
         fJ+oX5iyMm18M5bWakwz50FRA/NRyiC3Z3AcrIMtdGeb7+oc3aMVaitfbdscCkC+iMml
         o26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759885570; x=1760490370;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MUJ6n66R9/frzehs+phoBbOvXU1aQ8Z0NpUd/VCbS2U=;
        b=VgUC4VN7oIlQCVKc6BklyhB06RUrhC2fSPFy0xZAWe2+fswURf9HnPKh8Fb3ueveC6
         PleOK+pcsApkoOGlC0jmZAQWHJMFd7azVN1RKPFghUYChSX6eeMvvuHjfZnKoGoCkfwo
         A2VaZxQFiE/PPh7+A57/WvIvYehNZG/zG2mh1oTxcpOUuCP4B48Q5nnrXw4fZ/HI8f7/
         +oagfxb8kKZb/xNuwWn7VCXRbiKKHuCQyuY1klcgRKryfKcwysdIZF8OkYTyG9spY6Tm
         TpMzopzhOfNR9CANgaFWiQjP07PABenkirbyR10ftLW/eu2bYInNVy3EbuFrbr1DEFpC
         TAVw==
X-Gm-Message-State: AOJu0YzStC32mrG34ITMHDkc8FkjNdYLO2C1KpVbY4dM/arSIk9oMFtT
	cIk3w5zkg5ri68fYvkn5jkVlzY7h8pa0ggqoudjzZAOrfUzqDyMra8kwJXXl8Q==
X-Gm-Gg: ASbGncu2upZ5Oy+wrQEOUBNSXxwEof5Ejwuhn8N8t4Wa1RwhAsR1UErsDLMsoWrpGUf
	emEvLukF0WJsKljuMChAlUkF1MfQhzzD5fQ50mqVzEk/dC6lOQ44rO4JFaZlf5hQuNpaL7yEYf6
	xZIljWIa0043r3qltDlwr2TKM3znpXe5i4J2F70Z23xFi8dDCZ9oBKm2lvSGqhU/sF2zdFynGTb
	oKBjYhk9UsmywLLK1+epMbRNlbgrbS1CeNapB+Slh4SAak447xl/yBn30FK2VFE0OoQ375q6JR7
	1Vv/s20/GqSFYAUsDvPELldhHlgeaYAwhMrw3NBR8npxyhjXKYuM1K8Lp3CoOQFTEy0x+61nWzS
	b/c1jvor6CBOwS8POMZ5fac5ycr0rg0WBeYtuPhY48BYNhKnYlPOLH5gby4oil8Hhqhv1oBP440
	0wdPMfGmH4ov/jf0jq
X-Google-Smtp-Source: AGHT+IG/Wkfjyc+m4nFp4l1K2s1A2rZSGbCHTPvhSUIV5BtxqZUtW97hJ4N/6YyDKxUE9awSNU8M2A==
X-Received: by 2002:a05:6a20:5493:b0:263:3b40:46d4 with SMTP id adf61e73a8af0-32da84640d0mr1890796637.56.1759885569757;
        Tue, 07 Oct 2025 18:06:09 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b020535a7sm16926010b3a.54.2025.10.07.18.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 18:06:09 -0700 (PDT)
Message-ID: <95eff8b8-e93b-4973-835a-70d35176f2f6@gmail.com>
Date: Wed, 8 Oct 2025 10:06:06 +0900
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
Subject: [PATCH -perfbook] CodeSamples/formal/herd: Fix comment format in
 initialization
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In initialization of litmus tests, comments should be "(* ... *)".
Fix it.

Fixes: 915807a52e21 ("together/applyrcu: Use \clnref{} and its friends in Section 13.5.9")
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 .../C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CodeSamples/formal/herd/C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus b/CodeSamples/formal/herd/C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus
index 73859c24..86ea5553 100644
--- a/CodeSamples/formal/herd/C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus
+++ b/CodeSamples/formal/herd/C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul.litmus
@@ -5,7 +5,7 @@ C C-MP+o-xchg-rcusync-o+o-xchg-rcusync-o+rl-o-o-rul
 	int a=1;
 	int b;
 	int c;
-	int *p=a;			//\lnlbl[init:p]
+	int *p=a;			(* \lnlbl[init:p] *)
 }
 
 P0(int *a, int *b, int *c, int **p)

base-commit: ef86afaddd2705ea45124c967ec1ec046eaba4fc
-- 
2.43.0

