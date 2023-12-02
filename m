Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnlaiopA"
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA244129
	for <perfbook@vger.kernel.org>; Sat,  2 Dec 2023 09:26:27 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cfcc9b3b5cso14808845ad.0
        for <perfbook@vger.kernel.org>; Sat, 02 Dec 2023 09:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701537987; x=1702142787; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s7eLq3KTIyb9DpCVUDaRDt2kI4speRLDlqFK5gAmpPs=;
        b=MnlaiopAgcnJevlGKVRV7GasMW9p6kmQENpqWC2rbKi3P2QcmhNEUTsnDrLtMlOCF+
         x2AD17ezGNjbYmxFIvIvjCWFijobsO9iE7zoqYNew2O7Aud7duWkqgNE+K9ejesq569h
         9KlD14r/yIy36sK1YD9ztaiA+aLcOvXzHX41nvpRUcytt5ch9fZUR84pW09IqR6dufyQ
         yxVbl7Ud1eZxT2aAlgWDrGJnkyUsX2/WeFja8ohOfvOW/u7qebfaBQAaejuKTrWgv29K
         05gFLPvjaAemNPjKPwNUAlo1ewPJXD2Ofbn/JS4mSmK+meVD6Xhi+NAt1vy7VokqOVfz
         YQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701537987; x=1702142787;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s7eLq3KTIyb9DpCVUDaRDt2kI4speRLDlqFK5gAmpPs=;
        b=YZckp53U+Pg9R9OLXE3nzbAywPim0irUuV3Qdrp+GuUM4dKW4CIOSmkpP5UBrUFGcK
         +LKntmtjdn5jX8ekm5plZw41WoqO4C3Da2P+t6vB8OZW9vA9O1JDAVt6d7hwRLFRoXFo
         FiJrvLzFnl6qxpcAE1MYQjAT2p9myw+KvReYcRRJBf2N/8Qc0wDMMemZ/z1J91ZsLFMj
         krRIvqdwbrl6Aoj0FKje2+7CQhpMpNyXIdLwVS8Nh3iDgD4HF8t2PZazfiG02NU3QPLs
         6bNp6nYBrY6PEMLTJA6DGZXw0zb3+NwlaWcvUXJAeNXZfbRTPqHHUG8CglUFsppiEJLO
         ipuQ==
X-Gm-Message-State: AOJu0Yw9n5HHr/w7wkS6CqkABOVoqAAQSdfP6FpFYo3tLLeYtvSSBumf
	h7DrR/msASReRCebzCYk0tk=
X-Google-Smtp-Source: AGHT+IGD202iL5arWi3lyBgw4L8njLqbLlmHsAcIOIoYk45+JCWrCgqtLCE3aJCJh/8uVkUFP7UhUA==
X-Received: by 2002:a17:902:8b85:b0:1d0:6ffd:9e2b with SMTP id ay5-20020a1709028b8500b001d06ffd9e2bmr1573289plb.125.1701537987296;
        Sat, 02 Dec 2023 09:26:27 -0800 (PST)
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id x12-20020a170902ea8c00b001c736b0037fsm3600714plb.231.2023.12.02.09.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 09:26:26 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org,
	SeongJae Park <sj38.park@gmail.com>
Subject: [PATCH 7/7] future/formalregress: Use SEL4 consistently
Date: Sat,  2 Dec 2023 09:26:14 -0800
Message-Id: <20231202172614.20239-8-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231202172614.20239-1-sj38.park@gmail.com>
References: <20231202172614.20239-1-sj38.park@gmail.com>
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

formalregress.tex is using mixed use of SEL4 and seL4.  SEL4 is used 8
times, while seL4 is used twice over the entire repository.  Use SEL4
for the consistency.  Note that use of seL4 in swtools.bib is not
changed by this commit.

Signed-off-by: SeongJae Park <sj38.park@gmail.com>
---
 future/formalregress.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/future/formalregress.tex b/future/formalregress.tex
index b1a39b29..40bf2b35 100644
--- a/future/formalregress.tex
+++ b/future/formalregress.tex
@@ -701,7 +701,7 @@ so they are all yellow with question marks.
 	Indeed there are!
 	This table focuses on those that Paul has used, but others are
 	proving to be useful.
-	Formal verification has been heavily used in the seL4
+	Formal verification has been heavily used in the SEL4
 	project~\cite{ThomasSewell2013L4binaryVerification},
 	and its tools can now handle modest levels of concurrency.
 	More recently, Catalin Marinas used Lamport's
-- 
2.17.1

