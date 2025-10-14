Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41DB1EE7DC
	for <perfbook@vger.kernel.org>; Tue, 14 Oct 2025 03:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760410940; cv=none; b=FLEzTvfRWdvPXjVvR9IbQnKOLX8GG+HL/p6d07VTF1NufJVdCqdVCMoRcWw7n4YkXzhEZo44safKqE1GRwMx7ElBJVFUJ/aIDcbj4SoK5SS8+BYUIQudxs1YvRg+XWUNLo8zdcuSgT1VXgsYyEg7xTFp4Xovy7m+oQwWjyoyy2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760410940; c=relaxed/simple;
	bh=+u7pS4MjW5w/vW3AQhOKcGX4Rw9aVbeqEeQ6dOOHS3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ceZKL+kqfQ1U029lwZOeO0Si6wg8ZkcXtE6P9QVXa0/VzNm45jAjLCCflt74Yc2B/n2nWlzTiE7dTmGjffHoYZOnpYXQaSWMvtvMnrAeFiQOXVL0paIL2vUFxB514gcv+qMkwyvM9Bv+kBxeH+8nROB8e7e9XbBRispcFuHIno8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xp5NjZK2; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xp5NjZK2"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2907948c1d2so5649305ad.3
        for <perfbook@vger.kernel.org>; Mon, 13 Oct 2025 20:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760410938; x=1761015738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rzh+I9UN3ZP+xADdwvn0VMKVB5TUtMkOcKD6K/eVlSs=;
        b=Xp5NjZK2XIt89LMfxZVNwAbOv0bV425btHZIlpkD+c2ZZMhBhh3sAro0plYrA2Rlas
         uebwsjop1WeeZdt3MVJmkqPyQJv9x0L0QL+QjM/x6OSbuGNiSNyEKWPQF6svf6QL+hzd
         rgrOwayfs2OiZdOUrDg2xwE5FH49RC0CNoT2tQ7rRn/OamnRKOsDXVw4B8s0Ip5dkvXL
         ziybzc4vswMBTCE6cbcS5mmOwrdBKsBXXi2NaqYPt6lIyD6mkuDSWvqbpcs+0bWbIgM5
         4jKv1kAaV6eABqxjWkE+X7Di+93xO5tS5/u/3NcH1rVcsvYBnCusTI/xAHz4tGodRCiR
         99dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760410938; x=1761015738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rzh+I9UN3ZP+xADdwvn0VMKVB5TUtMkOcKD6K/eVlSs=;
        b=NxlvTuwzEe0vOCg9brttFUOugqEDCBWH90yQ85uPeFvyra+l186mk/IJ+3p9rAvBTg
         yOIyaaPa5liOqntV5JBj1U8mhebDSMM0xQwLLLWtuG4g24T8lu6YDsTHuU2O/1oj6v8g
         PPy9abpPkQ5Nh5Nn5NlNh7HlKEqoAWB4QTqRnzIN2VwQpTOLf6/4nHCRGZm7rws5FaAR
         TjJb8jcqsAuC1kPE/R17drU7cIOQBPZqVv3SsD1OPZaSGWnGNM1s0OYHqE7eDbwwuGDK
         zCuCW7e8XuFBOLSBJACbF86QrK9MkO3VvS7esrbd1eR3q+7KHuO1NLFDFW0ycaP+Z0VC
         8b5Q==
X-Gm-Message-State: AOJu0Yx6M+3C3ZCUQ3Zso6M8E9jOQU7AEaiHKSTOUIjeJOC817whvDZW
	pEV4IlHM6jv+qCtk1wKfRDqjibXp347uqP+EqN19L2OYC5r6pCsKK1f7
X-Gm-Gg: ASbGnctmRW/IYj/ymffBL8BF+5Ie+KMhlxJQmFBjk3E2sUFgz4MMuGzdlKSB72Tur0V
	UtzWHecbodS6tyoPfHE3NkXZnPZj7eHwbPIm8r8zkUefNqtT7bw/0vyS8TGOhXX28Mi9/z4MSck
	l2NJbRjrdCvmNbqVUvIUIJ2uijZUBf18KuEwO5k+060wiqJ2qYxNvikdkBsFEK24iz/zZgd3xrz
	Cl3nlyCOUD8y+s/FbJO3pkTUkbOX1kF3QMEI8x9t9nHp37oETkcTky0YDBoGbcrRUmuHKjo1Tfs
	wEgVgp+gB4zrmsezvmE7GSfWdh9RRJ0xVDJbdUfKU4wIaWtzgaTcE2Sek6VJD8EAQq6iOexnkE9
	+aaA9xLu7XDsX7CICoPQhHk8xs2pyygIcI4Ttfo0wrlzdF+i1C2S6SYvXvvjFVcfmuMWgLcu1sp
	JIFALtS5LxHvE=
X-Google-Smtp-Source: AGHT+IG4dX7+HdSDpgM6CntLaxa0aCoOxcv2U9474c7nfDmXwKFWn4juUvBHFosvyCO5PO6E7WRHMw==
X-Received: by 2002:a17:903:2409:b0:290:52aa:7291 with SMTP id d9443c01a7336-29052aa8299mr137743495ad.53.1760410938186;
        Mon, 13 Oct 2025 20:02:18 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df2799esm10219069a12.29.2025.10.13.20.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 20:02:17 -0700 (PDT)
Message-ID: <798f6a18-3b68-4db8-b6cc-bd6c3dce4e13@gmail.com>
Date: Tue, 14 Oct 2025 12:02:15 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 2/5] docker: Remove "-A" option from localedef
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <ec715cd9-35d8-4ff4-bf08-7b16d531ae78@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <ec715cd9-35d8-4ff4-bf08-7b16d531ae78@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Ubuntu 25.10 stopped providing /usr/share/locale/locale.alias, which
had been declared as "obsolete" for quite a while, as is mentioned in
its header:

  # Note: This file is obsolete and is kept around for the time being for
  # backward compatibility.  Nobody should rely on the names defined here.

Remove the option who depends on it.

Note: This option is still mentioned at ubuntu's container image description
at https://hub.docker.com/_/ubuntu#locales as of this writing.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 docker/Dockerfile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docker/Dockerfile b/docker/Dockerfile
index c3e2a237..ee120e4b 100644
--- a/docker/Dockerfile
+++ b/docker/Dockerfile
@@ -2,7 +2,7 @@ ARG rel=latest
 FROM ubuntu:$rel
 
 RUN apt-get update && apt-get upgrade -y && apt-get install -y locales && \
-    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
+    localedef -i en_US -c -f UTF-8 en_US.UTF-8 && \
     rm -rf /var/lib/apt/lists/*
 ENV LANG en_US.utf8
 RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=UTC apt-get install -y tzdata && \
-- 
2.43.0


