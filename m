Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D11926AFC
	for <perfbook@vger.kernel.org>; Wed,  4 Dec 2024 03:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733283210; cv=none; b=BLc6+73W/JiDvdZxf5D1ntG5ZHArDpGj8SWuLWFkGs67bLt5QrMdc+ydv4YzcT3oRxT3ZLrcMNMcyptLznxHpIjD5LnasaSfzEucxYORy2j3BJy9t6qHdo3QwZqS7P8Qe2Paa+XHFZ7gutQIh5IJbq/70Xr2jLcZewJoweFv+Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733283210; c=relaxed/simple;
	bh=A8U22Y6Nuhz1+Kq0tpljTUepDbZNrK26sl0QUTXnDoc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=RlUT/eRTSybTNP3jsC+kw0uu9jZZdC3TTlTWhW5tY8uTRXjxvLXIhKtoTnUiCtV+zf3bbK6Mnn1V7DHdzmMqY0roDsytgoHT6fk96XOqldOhLGg5L8qYKsz8cO3o/dERzTPL4dmYszPBvSi8bJFGtt6xEFM+7BxiQZIgUl5gobo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lj+bFzRe; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lj+bFzRe"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7fcdbfd8090so2168203a12.2
        for <perfbook@vger.kernel.org>; Tue, 03 Dec 2024 19:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733283207; x=1733888007; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8W8QuKeNlYYV3nZHlCEEl63hsQ6mewGj+G/rZe2TO8=;
        b=lj+bFzReMmsaS6o3EljCOvSCgSu6zsL+TKgm/gKxMc/wbc4QvhYIx78qCxjwApwQJY
         0xQS03hlM8iLuHChX6FxpRT3APEWdvtLMcWlDkyBWnLMppFWMkFWzAzdGBlbd2+lzY20
         KLsjlvd4yNMuwIE0errww252e+WdyT2bmd5RQ2dUo8Pkb7otxpMuMxq4u2FfueGvKFeD
         IUzdz0q51yqJlzRttxwyjPqyflJcbDGYUi7bydgzV1WSG2TYMyTerb6dVSKUJgu5M2fv
         Us5CVHH4bay1KVAGliYdSCmVoUxJFD7XS+OMQGFCiGciyz55Tuwa4HqaN4AsBr5YWv/i
         YUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733283207; x=1733888007;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I8W8QuKeNlYYV3nZHlCEEl63hsQ6mewGj+G/rZe2TO8=;
        b=I1nmfdtFhT3RGxDgLmhsS0XWRkKw9xOanv8ADWqfcp2mfL+DRyh1rYwF7x1dKut7eX
         Mg9ikbr82wqUd+rejR2IHBNY5GluII0irG04O8wAdGVX/q0aDbesQYEt8nNFI4xQdY3Y
         t6daFChl6AtXCUBz23Ib18fPAQdULik1tGN2jzWWltQBGIoy9OyhYbuDbtpX2nusvdKc
         ynbX5Ij1nEjOVJptdhSYhDDKm358XZdDvak1m3bMNxhJWVy62opfUnmDa3gbs1MGnAtY
         iHMn8qo2VsEfjCPIk68CxgG0np007wtT2vggZEIklcVtQEmhAmazWm4rgkRF1RK5PdB9
         uYdA==
X-Gm-Message-State: AOJu0Yw1x2TBLt7vXoFLU4rFClkFMqtS9+0mT/N2apc1zojhnfUI5KSM
	qOpw67q2Jj+kzNFz4GB+LP7IeuFZoOutDK6w/ONl3iNeRgU4D73iqm1bDA==
X-Gm-Gg: ASbGncsGeDN19suF4IM9jOPhYTTScdh8Xxlfe6gUsZzNB5fAExBCLEFk/IbdjKVbneF
	Pw6QjQWqRDkWhbog298TmxFnHDNdWhso+/X81bZXh/jnbS4w9UfEJp3/hKOta6W3xzLzJUezDGu
	ahowlGA+4Is0I/quq2YB34wtGRsW88ZcmByr4ganoXSErxUU0zRCN70p8Uq8hESeMdvHFIwwtk0
	DBEpQXYDWdSoycZ3OeyRi2LqFzqclvxPyUb55VicTThBQC4JgW1g/1AB7Iyd7e//nCTIqG718VZ
	2T0pXqUY3BOZWNcx
X-Google-Smtp-Source: AGHT+IF8nw6AGMSOcWxOAxWEp37u+z0aAWN7uCjd8hWcDrV6GCdDQOClxVTOvURlArDcjvGq5MGOug==
X-Received: by 2002:a05:6a20:7f99:b0:1db:e096:8497 with SMTP id adf61e73a8af0-1e165334d1fmr7217075637.0.1733283206655;
        Tue, 03 Dec 2024 19:33:26 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176129fsm11257841b3a.4.2024.12.03.19.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 19:33:26 -0800 (PST)
Message-ID: <3d5a7d0b-7a3d-4629-bfa9-724b820869bd@gmail.com>
Date: Wed, 4 Dec 2024 12:33:11 +0900
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
Subject: [PATCH -perfbook] CodeSamples/formal: Update rcu-test.dat for v6.12
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

As the total line count has exceeded 35000, tweak yrange of the plot
as well.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/data/plot.sh      | 2 +-
 CodeSamples/formal/data/rcu-test.dat | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CodeSamples/formal/data/plot.sh b/CodeSamples/formal/data/plot.sh
index bd325d58..93b13494 100644
--- a/CodeSamples/formal/data/plot.sh
+++ b/CodeSamples/formal/data/plot.sh
@@ -17,7 +17,7 @@ set ytics out
 set y2tics 1 10
 set y2tics out
 set ytics nomirror
-set yrange [0:35000]
+set yrange [0:40000]
 set y2range [0:50]
 set style data histogram
 set style histogram rowstacked
diff --git a/CodeSamples/formal/data/rcu-test.dat b/CodeSamples/formal/data/rcu-test.dat
index e56d1d7c..e984fa8a 100644
--- a/CodeSamples/formal/data/rcu-test.dat
+++ b/CodeSamples/formal/data/rcu-test.dat
@@ -98,4 +98,5 @@ v6.4  21444 11748 33192 35.4
 v6.8  22018 12071 34089 35.4
 ""    22108 12076 34184 35.3
 ""    22579 12085 34664 34.9
-v6.11 22676 12095 34771 34.8
+""    22676 12095 34771 34.8
+v6.12 22834 12313 35147 35.0
-- 
2.34.1

