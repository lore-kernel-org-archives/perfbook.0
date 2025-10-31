Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA542F60C1
	for <perfbook@vger.kernel.org>; Fri, 31 Oct 2025 16:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761928927; cv=none; b=fWk7xRL5PwQ3RlznYOADT5aB4qEgeMGYUSpLFKtLOl5+jv3tzAAGnVPvAp4pJS+hGwHI8gcDSbMoyGiRH4HZDAV/qKrhZu0xic39aAAsx+tFu9/MAkcj+P52jpPvc31C8NKH/lbE057auoK8YX3Le+d0g7VvimWHiARWxPo1Niw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761928927; c=relaxed/simple;
	bh=ALS5jMZgc1GgVhGTjQ9b7WgnKworhn++gxGdBHqqqfg=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=NXHjFFmZpz0hjZLp3oSlvFeLTacS/hX8sjUIzQmF7b27kjNx4asWsUXHU16oAEBUUVriFPT9Jp8rtiSgAY+eSM1W8Tdu8UTXyy46whBagSSzjWU0wpNBTAsy7xjtO+IS9MKxqLyHhr7kbmEZzU5rLfjAfPXxyGKIwoUjd42+4aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/sQ4q5w; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/sQ4q5w"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso2239258f8f.1
        for <perfbook@vger.kernel.org>; Fri, 31 Oct 2025 09:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761928908; x=1762533708; darn=vger.kernel.org;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JljbszKSyTnoyXYNXv9zD50IgBYLvmsTehj9W4amVgc=;
        b=g/sQ4q5wjTuhBWJHu31PqxDUhg4+GQt/BwYCtpMwCjIA3YWpqdxPtb6PipuqQ63kFl
         M5EklV6enNrgfOinDr2VLt7HW9gF0nwr2nMxNm1XUMTcUR+wtCW/UXvT5UHOxf1r/taR
         g70IQ10TCqYK3iIxjaoOGFsXlslIR/MXao7thfHDX5LLqMhejoHBvXGCyeIXRz2yPWpS
         VkerEP1HNDYQjNXXfe9M62bntHItNjrhwkU46vA2XGJTL8/wBEC9fr8Jxux05hI3g3R/
         hfB8XDYvfAQKNnc5s8CzOC7zwNu4oKNc6MM/8K4GkYsqLlIPGyiXt4TXdJvc51w1zxba
         l4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761928908; x=1762533708;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JljbszKSyTnoyXYNXv9zD50IgBYLvmsTehj9W4amVgc=;
        b=j6mJdlZWJYeR7EDumWZ0V4Idis7Wcx3mzUnPhA5BqBPZ6KCKdt3LGofPcCh0NylLIo
         ozWwrxgC6ekUc85Magx7nRAWjhvuf7ASru3wRE9xwcwt4boZuI3Uemd8zaav61pcidhu
         vEhqyxbsoKCAPye7pPMyXf7PjIGq211xUIpwiy+odMGPgWTfBxowqbS2qyfRYHcN7vei
         4HlFxS1/jCRG1ZTJgmu0HrXl1/+JjMv7i7sq4g+TIYPvL9lDS5mWKo3IDDYloowD63FX
         6Tt36yPawvTUMcG6ELeADDD2B4AwU4ZvnQtrfsFCTilIe36Bv3KblqKdxNRrMP47wpI7
         LA+Q==
X-Gm-Message-State: AOJu0YzME4WHixLqOM/jZd/WQQg7Ho5MKPwVgNBYazItuNbm38NQXSc2
	WVaYAHa9SRIFrRr/ysQciuXiW1H+qJLqK8yKn7oW73NbeepkUMrKRKN0OdWugplZ
X-Gm-Gg: ASbGncs1cfJ/vSvOfQTiqg0KzJJIAX0QuWpIyw6n5r1Vguu/hBiy+OQgVsOuRoG2xeR
	cNQGuU8AUmMZGqJC7tuJSVqeSPAFntnA+oE9mkTLI68pjl7ELt7RnoBBmkoF7O6fTsGVDxtGhCN
	/KfNkVNDRLUazb55RGZGRljBdBexOI1/ILSzhzuZH33toegf04BC11kjVwaKGJZ9elP6rZ0Ydoz
	U6/oHn0mGKFavAKWscTMs+UpVTq8tfz/dCkX+5rE9Ol7qQ7Gu9qhkPSa4mn6h9uSbJf9vMFKbgz
	KuNndmVmk5av7J3k4Rng3te5EoVchWMIsGBPpOt2necqzaj9eKXs/YKG3jZFBudnzpz6fTkUHWl
	8XMzD66Cj1IeUFGATCBz4uJ5/N/8Ngg06vPV3GJrjLP3ZEkJ4hRu8iPpYurJRMQDOsd4P43bT6B
	S0t/jhwyDVbAC2rIg3VoujheNGKj/WXMCHuqZa6q2VAU+9CSWoUQGKJ4XnPriMS3P2JRPuGbix
X-Google-Smtp-Source: AGHT+IH67T7XyrZJm+6rcp5g1dwAyEjrxUUo9Y6SjKrLQKVnukZm9CtQkGvbImBE5z7IZ9vzKGetdw==
X-Received: by 2002:a05:6000:2306:b0:427:374:d91e with SMTP id ffacd0b85a97d-429bcd051d1mr4534951f8f.11.1761928907816;
        Fri, 31 Oct 2025 09:41:47 -0700 (PDT)
Received: from smtpclient.apple (nat-wlan-eduroam-192-41-132-228.uzh.ch. [192.41.132.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c10ff20esm4501248f8f.1.2025.10.31.09.41.47
        for <perfbook@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Oct 2025 09:41:47 -0700 (PDT)
From: Hanmiru Kim <hanmiru.kim@gmail.com>
X-Google-Original-From: Hanmiru Kim <HanMiru.Kim@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: [PATCH -perfbook] getrusage: minor typo (runivcsw -> ru_nivcsw)
Message-Id: <149D6154-3E78-477C-AA04-C6F28D7228C5@gmail.com>
Date: Fri, 31 Oct 2025 17:38:50 +0100
To: perfbook@vger.kernel.org
X-Mailer: Apple Mail (2.3826.700.81)

Hello,
The `getrusage` example listing contains a small typo: the underscore in =
`ru_nivcsw` was missing.=20
See `man 2 getrusage` to confirm.

Thank you for this wonderful book!
I tried sending the patch using `git send-email` first but I couldn't =
get it to work. I apologise in advance in case you receive two emails.

Signed-off-by: Han-Miru Kim
<hanmiru.kim@gmail.com>
---
diff --git a/debugging/debugging.tex b/debugging/debugging.tex
index f285ebc1..ccc33ef9 100644
--- a/debugging/debugging.tex
+++ b/debugging/debugging.tex
@@ -2609,7 +2609,7 @@ int runtest(void)
 		abort();
 	}
 	return (ru1.ru_nvcsw =3D=3D ru2.ru_nvcsw &&
-	        ru1.runivcsw =3D=3D ru2.runivcsw);
+	        ru1.ru_nivcsw =3D=3D ru2.ru_nivcsw);
 }
 \end{VerbatimL}
 \end{fcvlabel}

