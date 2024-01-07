Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2345E13AD5
	for <perfbook@vger.kernel.org>; Sun,  7 Jan 2024 17:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8KZ7/pi"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-360852ae88fso6397025ab.3
        for <perfbook@vger.kernel.org>; Sun, 07 Jan 2024 09:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704646892; x=1705251692; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0ZuqlkaIbb9zCmXsHrul3jxLhCvUIgpXO+EXJLN/3c=;
        b=K8KZ7/pi/V/hc/WDA2eFjaYxrfmxvdx55vaIwjF4rGS4YyEVozua96WYMJPWgpXwEu
         z8JMdfmVz1JlIbLWzSDTNZKpBOcT6EJdXrfiynIxF3RyC4Ba613NzeNfXKJY1go2ZggC
         tLDDKDUqwgYCc1IZsRkwAzh3Gq+2Ynug34+H9R1c30PrdRYrcXigVTM1OG3kNihPIcAL
         AlWzEYduT6nRspdOg3xedRsXHXlXYhfDxsyat32e9tthK88b9o+yPW/skVT8zI2f/+ZL
         UuQnc7G/H8RoxDFCOU7dZ6P6ojh09A9ytCXIKwTE97fz0fzNpDefDyrclkFwt+dMmiw0
         ZkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704646892; x=1705251692;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0ZuqlkaIbb9zCmXsHrul3jxLhCvUIgpXO+EXJLN/3c=;
        b=PcJPrbNbxeJn9KMmzJSs+gsdyEnJM1V6bIiWLXf9ucbBInbnn+KompPungjbILoe4v
         3R9c5YED0/R4fD4wD7Mbn70ohDmpiZWBqi4puHi7F7CCpJu8LrPV8P8hmdOwmDCfQ45G
         ctl192w3j+jKa84/Y4P0qxHhrGYZGsp9Is6pq5wKbrn1vA9ZEO1tEX/xDdoc3CRafnGC
         WwiJ0iVHLEwLitGQqYs41EvE9uTHv77Vwd/gMOZ1WMvcBApUWOpj58GEOxRSFfofsK/o
         t2wmiAcqveWSnP1qr5VQNbQrWNgDT02PjjMrSMJPGTANIYsu+yZehGtc/wpDvX7DtOKa
         Ufkw==
X-Gm-Message-State: AOJu0YxOkyvE3KqZ74zSd+0fLIEclzBgzy9geXSDdrDIbufuyV2omTea
	N/r1NbuVNIdFFBFXNIrqC8g=
X-Google-Smtp-Source: AGHT+IG62Mm9MWRZ+o2H0Px34c+wBi0NF1E+l2Rv9lL/Sca08gorXZTP/9+SJ0UpBNTxy9ikt3Bd6g==
X-Received: by 2002:a05:6e02:1c45:b0:35f:d8fd:8ecc with SMTP id d5-20020a056e021c4500b0035fd8fd8eccmr4703147ilg.0.1704646892077;
        Sun, 07 Jan 2024 09:01:32 -0800 (PST)
Received: from localhost.localdomain ([216.243.7.87])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902704700b001d3f03c3460sm4608469plt.158.2024.01.07.09.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 09:01:31 -0800 (PST)
From: SeongJae Park <sj38.park@gmail.com>
To: paulmck@kernel.org
Cc: SeongJae Park <sj38.park@gmail.com>,
	perfbook@vger.kernel.org
Subject: [PATCH 0/3] appendix/toyrcu: Trivial fixups
Date: Sun,  7 Jan 2024 09:01:19 -0800
Message-Id: <20240107170122.18010-1-sj38.park@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>

This patchset contains trivial fixups for appendix/toyrcu/, which found
while doing Korean translation[1].

[1] https://github.com/sjp38/perfbook-ko_KR

SeongJae Park (3):
  appendix/toyrcu: Add missing parentheses
  appendix/toyrcu: Use \co{} for spin tool
  appendix/toyrcu: Add missing parentheses for rcu_quiescent_state()

 appendix/toyrcu/toyrcu.tex | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.17.1

