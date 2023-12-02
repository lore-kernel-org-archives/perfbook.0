Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ed9Pk30V"
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E31BD
	for <perfbook@vger.kernel.org>; Sat,  2 Dec 2023 13:33:53 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3b837d974ecso1562685b6e.2
        for <perfbook@vger.kernel.org>; Sat, 02 Dec 2023 13:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701552832; x=1702157632; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/8QHF6mXqShons/ys5ln2Ob7ucbLk/HAHGl48RpD1M=;
        b=Ed9Pk30VZemAlTrD+eoz+I8uxmFMWpz4PXTskiHlYdRud2Hb4M/CZvYKCVHWzKutdx
         I6D7JD6jzp9pz2ve/2UdF/LyfnnJRpqgZDGZ1+QMOXuHx9INrG5xuu24ClcATTcWhodD
         EjmjLvZL85lqUaNGPM/77NQp2L3XcS5RmvFQVZyO+Fl6BWccqudK5o6DMHisYiJE+/OQ
         UmYaFMdEwfBpLa6Q7JobpIVoIaace8z3v+Kq64z055ZTChJX9KJ++Rza+MMJ6hoVtTq9
         8tiW3Z8ybWhKA9FOe2mE9bFIFseCvxuSHYEJNJtOdXNxomnEywVsF6TFdLbHhI7ZnNAY
         TD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701552832; x=1702157632;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/8QHF6mXqShons/ys5ln2Ob7ucbLk/HAHGl48RpD1M=;
        b=qbBsnOrxYqLfcocuar4X0T87C/mWNBnsZr5KVmmiHNiE2ZK016tEdHok9db9Ian7ky
         GmzQhp4+bZeyRML/NdzFxe4xL1jbR6xBIt9tuKgPJzg286P33yRvddGyARKDtE2IZK7o
         HZb8b884qVFIrf+IrhBf1egEH1XVIrx6185vzG89bJyPGFFvDsOWAwVYTBhCvXBoJbV9
         vqYnwlSUsUyq+3ymkG/lGi9+iQRRWvQ0FpnO/H91FhnjSvwS8ekYRm8NQmU2K3tR6gzo
         9oUt5VwMtQUrv3idRUmd7wh2DQfXbpPTcdu/7/Uc6hBEw+Gxc+I5mMTNCYKr39A/qYr9
         Sn4w==
X-Gm-Message-State: AOJu0Yz2qTqVpNP1j9gd6i7ZdM86u6NCD4NRtnxkQ/wSbaN96WR1QNyg
	iJqcua689PGJb4ZU1V1MqJ4=
X-Google-Smtp-Source: AGHT+IGFjYEiV1Io8NwUtlbpWKqfXVWK9ebax5ZsD9qZTZV7ZY8AaHeF1bdsp4uv6tTp33eCmIFEcw==
X-Received: by 2002:a05:6808:bd6:b0:3ae:bae2:fa76 with SMTP id o22-20020a0568080bd600b003aebae2fa76mr2418424oik.36.1701552832388;
        Sat, 02 Dec 2023 13:33:52 -0800 (PST)
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id l13-20020a170902eb0d00b001d07b6a0af4sm1252643plb.182.2023.12.02.13.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 13:33:52 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org,
	SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH v2] future/formalregress: Use seL4 consistently
Date: Sat,  2 Dec 2023 13:33:46 -0800
Message-Id: <20231202213346.23070-1-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

formalregress.tex is using mixed use of SEL4 and seL4.  SEL4 is used 8
times, while seL4 is used twice over the entire repository.  That said,
seL4 seems the intended name since their website[1] uses the name.  Use
seL4 consistently.

[1] https://sel4.systems/

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
Changes from v1
- Use seL4 instead of SEL4

 future/formalregress.tex | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/future/formalregress.tex b/future/formalregress.tex
index b1a39b29..63c9021f 100644
--- a/future/formalregress.tex
+++ b/future/formalregress.tex
@@ -118,23 +118,23 @@ that the compiler is correct.
 An alternative approach is to take the binary produced by the C compiler
 as input, thereby accounting for any relevant compiler bugs.
 This approach has been used in a number of verification efforts,
-perhaps most notably by the SEL4
+perhaps most notably by the seL4
 project~\cite{ThomasSewell2013L4binaryVerification}.
 
 \QuickQuiz{
 	Given the groundbreaking nature of the various verifiers used
-	in the SEL4 project, why doesn't this chapter cover them in
+	in the seL4 project, why doesn't this chapter cover them in
 	more depth?
 }\QuickQuizAnswer{
-	There can be no doubt that the verifiers used by the SEL4
+	There can be no doubt that the verifiers used by the seL4
 	project are quite capable.
-	However, SEL4 started as a single-CPU project.
-	And although SEL4 has gained multi-processor
+	However, seL4 started as a single-CPU project.
+	And although seL4 has gained multi-processor
 	capabilities, it is currently using very coarse-grained
 	locking that is similar to the Linux kernel's old
 	Big Kernel Lock (BKL)\@.
 	There will hopefully come a day when it makes sense to add
-	SEL4's verifiers to a book on parallel programming, but
+	seL4's verifiers to a book on parallel programming, but
 	this is not yet that day.
 }\QuickQuizEnd
 
-- 
2.17.1

