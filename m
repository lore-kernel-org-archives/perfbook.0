Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA49B38CFF3
	for <perfbook@vger.kernel.org>; Mon,  2 Mar 2026 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772443226; cv=none; b=hmpYht4Cd4YpeyIAyvRPb9FVICkF7Mjpk0AyGefR2uJ8wkx72SOHqUFcAzlAvW9eDM6Fq2mCVkyEalbkWtg8JCh97Y+ZIvrSxb+3w8dQNzIAzOBifmwABeTO3BMkr+7+Pbnbr07qBFNh0TExZ9AkqdmJAGvulChK+QT2B6HlD2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772443226; c=relaxed/simple;
	bh=8TDpOts88vaVYD0dCYyX1HU1u2FxMOtiIlbwVkhZ1Gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVnjflWmhsODJxdejZqyNA/8puOJbDxYqju4c3IXFZMzZdG/9H+dOeZlhBmIB6vERX7MS6jaOJpSsygqvuymJ8VUXz/MWBiHXapHuLh24dM2Ao0dyvIQuccNDXjz8vQs3GiiLDl3NxJNWmV2Hp928zXVInft7SDtA56pOX/fI+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwwLmJTh; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwwLmJTh"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ae527552acso2014625ad.0
        for <perfbook@vger.kernel.org>; Mon, 02 Mar 2026 01:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772443225; x=1773048025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3OpCrRs7qlniCaLvY21vEs6JHnHeT6dqFZFe4Rqgqe0=;
        b=dwwLmJTh4RPRWvF92HmbkKG7ItavbsJ5E6C30OmCZksIa16sjenR0pE6WpXj95nZKo
         S4LoJsjtLD4V+h3w8yrtJe4DphoUhVW/iKp1WHQSd2rcUvul6g20pRCbAsFlzcIAZq9C
         PGc7WMpUnwu5ys5N5UqX3Ll0fTMmLuJcu4yWnV5888zYPuTy/R7zY78MJuNo0MKxOU+Z
         sfnjww/FTXhsI0Dcu4rkw7v7GxDVzST/ULuFtTMifwqtDOGFMBJ+FZa2l+6hzx7ULr0S
         gAWn+jRLL/MWkuc1AK9Z3NC8B40wxcVJuFlQ2l+HQPaw9IjKNKd9Bn9vF+uswR4PSeyL
         s0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772443225; x=1773048025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OpCrRs7qlniCaLvY21vEs6JHnHeT6dqFZFe4Rqgqe0=;
        b=EwYSVDhpg+hGGc/hTOiUgr29dSvPcx2iwGvWZowXNqSXrA6AnEyVwdj9TQJZnWmCn2
         T5T2zu9hTWX4QEsHa3Lv6xg6ugAgD35ApKBGZGeAptTumQZ0by3MbuV+6gP7quJKUGwf
         mYUYvzdpFTcQcE/p8qbWwfJNp7va7GW1cXrRp9dgZYuQnghjb8pUA2Sb87QVnPM/zdpS
         oGLn2w6GoBHZ7k7vD0k15vdnHzpRv2AKBuKYjQwt9fbF3jdTrvsxiWyaIAAq2INvisoA
         bfC6ZCgCNjXAgZfp7KCCHUCdHh6IhbhzYLviUHWgv8ge8yY4Olo4mWvLl8JUuoS4jpwW
         k89g==
X-Gm-Message-State: AOJu0Yyp4Z7N2xr9h+0voKUB6B2BBHJsJ6oc9uksFALTkWSz9uTJfKHe
	hYTLZnKNnAG/iod4AwxZCkE7FdA4RBIgPl7OzTCzLl4spy8a4Hi2kOOX
X-Gm-Gg: ATEYQzyk+2SWPOFsNDT+s1qfh6F5DIOTUhGJt72bc68m/Lm0cNl/0Hyq3o9sCClgq9L
	X4VpewOnxYqYJN+eOuCPYq0El0JZ/htIjlTFQ9lUWNjDhpSKLd24aT463lfo2CIs6Z9FYr/Ps6Q
	VJ7nwcnAmmZE/1UBWtiuWu/6DPQHRJxIo7WXd/X0RWQOz9VqXGvjlUCxMBN+IU8CxYj0BAja+HN
	tCGV/SH/ryvhpbIIArRLI5Wj1wluaZkmtoXrm9+SzmBNx1chmglW7MQrv6S+Mo4YMlx++bZOklW
	7sYMoWgpGvWEs6wIzSsk5Q7wc6oTWmlqgkEcaljNB+SuBseb1A+syez64bcVqprBRQy2O3Ug2j4
	aaH/DrUCyjduFHO53c3NygDFY2uYzBN0VMa7ZbYvK/aL0fTna/WR5psLflZL9+RqlBsdP+rjRxx
	foTO5yR2tzoIER6/gCua+A7ls0OORCBEzyVBMF+Ps+uo5s99BibCQRCVnF9kki3MwafAEG
X-Received: by 2002:a17:903:2987:b0:2ae:4e20:9d05 with SMTP id d9443c01a7336-2ae4e20a356mr33102775ad.35.1772443224940;
        Mon, 02 Mar 2026 01:20:24 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae51bb9da6sm20450135ad.36.2026.03.02.01.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:20:24 -0800 (PST)
Message-ID: <1da9f62c-77ec-495f-9f2d-9c0c5a5f9c4f@gmail.com>
Date: Mon, 2 Mar 2026 18:20:26 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 3/7] Give page number counts room on TOC pages in
 -1c builds
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <28c46b77-ceb8-4b4f-9f8e-d56ef6b2711d@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <28c46b77-ceb8-4b4f-9f8e-d56ef6b2711d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In perfbook-1cnq.pdf, Appendix starts from >1000 page.
Apply the same tweak as commit b404be779856 ("ebook: Allocate
enough width for four-digit page counts in TOC") for -1c builds.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 perfbook-lt.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/perfbook-lt.tex b/perfbook-lt.tex
index 6dc698d1..724e1b83 100644
--- a/perfbook-lt.tex
+++ b/perfbook-lt.tex
@@ -164,9 +164,9 @@
 
 % Tweak width params of TOC
 \makeatletter
-\IfEbookSize{ % for ebook size build (more than 1000 pages)
+\IfTwoColumn{}{ % for ebook-size and 1c builds (more than 1000 pages)
 \renewcommand*\@pnumwidth{2.2em}
-}{}
+}
 % default params defined in book.sty:
 %  width of chapter (two digits):			1.5em
 %  indent of section:					1.5em
-- 
2.43.0


