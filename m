Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D590E28030F
	for <perfbook@vger.kernel.org>; Tue, 10 Jun 2025 10:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551762; cv=none; b=pgmaTXDmXyK5vnG4+x10aAWTTyNcCUkt42IU0bks/YJc0rMK5xuECzcgD+VUV/cbf4TU+Wt/SI7cBw4w/CDXZFZhplVgn62W15kPCwiZNRB0mjJsP/kydHadzvpf4rmeFOB5691X/EKyzipROB7FSctmr/WLAhUKqJFBUHUI/T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551762; c=relaxed/simple;
	bh=1oV0cXv9k3CCg0UDnXgSyOi8M4T3DBiobRZzbpK248M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhRquhwQCwGgifCqLV119+KAiDKCHhUsRq6BjkfZzVhGgdqPprzmVYwauPgWaxtn9tAoXdGthnnGyQtGnLQ7R6xw82Em9O3L86wUvNV8SLcsDV2zj/HPOM6QTmaOwdD1Wlz6BfQGzCqdzCy/S/pWlNEONw7KFXJCeAr8nRqRKY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdI36UdS; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdI36UdS"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235ae05d224so45432785ad.1
        for <perfbook@vger.kernel.org>; Tue, 10 Jun 2025 03:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749551760; x=1750156560; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iF5rs10tEjm5xFZBAkF1mfBcIk/WGO6aex0bqDwqSU8=;
        b=jdI36UdSC2wIMgoC20AiTj2dlTKqeRplg8kB9+ShVrtNrMKbzbQKSWFGd8BsqhLfD8
         5dPb0BF2SbSajk5zNzqdfBPjST8xQfrR7ys7Gp/NACJ7fOF5i5iT+52/FjWhHcrho5uA
         uUkmQpC7KSchSulUIRvZtQ5ZsQWMUu6aJ/xbsMSBli0HLH7soFsrJ6iR+ZnAXqzxzEKM
         wRNtkaf/raqT+oPTAqaz3T6c2RdWg5rADgYRuW8pGtRp7/uA6HBlbiLI6HO5Y2ONonqn
         CBNte0smObVdhns/ShfnIY9nGRZT8+8AMKtaoVggobFBz+z0TZ17vQfI6XWbnUxP34zg
         Yo0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749551760; x=1750156560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iF5rs10tEjm5xFZBAkF1mfBcIk/WGO6aex0bqDwqSU8=;
        b=cs1cCyConA59BzYkFanJOvAz3wVa7QSi4puV4F85V0kZ6au1v6gyqRLKqU1xvfQbSY
         7dtCMaTw5BzAT8VxFporV2KEFYHHcNoKMunF2Jy4YRzhTog0KSQ5VAcuj1ufciVNtyDG
         1wiCh+gCjCJZRAasaQvNzTsYweOn3BHrgsy/dgd9UpuMOTcaO9mXhvlW3qm63Y04C417
         LpfeIqbDcf8VnIPRLYIVEyHCSIdxNmMoGjsj2me/4+sfvKn8HzAT0mtYPLPYsgbNgtgK
         sz8i7DBC8WewepN1Uayy5MXAt5qZGtE0fwXJUb2Qbqijjks9bNOwHmT81FxBI1tzOfMO
         P3Gg==
X-Gm-Message-State: AOJu0YwlNfMtNWDv61lCmEaw84ToXZ8hqgYD+Cl7LB194saOFsDVNAmo
	/StOZGqhDnF3lE/PlwIp5Y2+8JFN7wJSaVFHSH0kpa5yC2m30Gn/fU3o
X-Gm-Gg: ASbGncszmK/QcEtJ++gXRGzPTEN2hpLb9cCk8fyFZBQtbcbclizpEu+N1XyolAGdVbK
	GIXMmtmdSJaQNc92VXypB+7SFonGYsFi9wXjTAWG8ADCJeyyLjQ5LVdoBrOWfdLq11kuPrdfMGl
	sQvuKHvu9PvVnlivUnSfK/FFqXwE4IzqJ7Lxdx3PN8DrFd4vLSvYhKldFBjxROrc/smnJzvinmW
	tLLbNoE62sMsFuOq3gcWyLyDh8A1/1P3R9LfxdTfZQzma8aWpSVeXgW7nSnNh7Svyms5TU+BOfK
	OYCZ4st8N784GolqW3NDZnTdxsuaAYyLFRn6+K3uY0G1WzFA88IaSCJ+HHyjxRA0tcZYGCYkbPM
	LXDO3wTK5lDDTKST1n7tWPUF/76b2fbZW
X-Google-Smtp-Source: AGHT+IHMGm5EEnUfCMGLC6jytbmvu3q8v0uoVyvCBl7Wo1S8Eg6CYlQTo4PipA7YinrOMN0DycnAlg==
X-Received: by 2002:a17:902:d592:b0:234:adce:3eb8 with SMTP id d9443c01a7336-23635bda7bdmr43856505ad.12.1749551760054;
        Tue, 10 Jun 2025 03:36:00 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fcd6esm68561705ad.102.2025.06.10.03.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 03:35:59 -0700 (PDT)
Message-ID: <19b41193-3d17-487d-b3b9-a0ef83e35963@gmail.com>
Date: Tue, 10 Jun 2025 19:35:58 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 1/5] CodeSamples/formal: Update rcu-test.dat for
 v6.15
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <2a03c9df-bdef-4895-9459-477e9451d3b2@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2a03c9df-bdef-4895-9459-477e9451d3b2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/data/rcu-test.dat | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
index 33a66ac8..dc7ac7ec 100644
--- a/CodeSamples/formal/data/rcu-test.dat
+++ b/CodeSamples/formal/data/rcu-test.dat
@@ -101,4 +101,5 @@ v6.8  22018 12071 34089 35.4
 ""    22676 12095 34771 34.8
 v6.12 22834 12313 35147 35.0
 ""    22961 12414 35375 35.1
-v6.14 22107 12620 34727 36.3
+""    22107 12620 34727 36.3
+v6.15 22300 12758 35058 36.4
-- 
2.43.0


