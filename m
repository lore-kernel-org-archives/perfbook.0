Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E34221CC71
	for <perfbook@vger.kernel.org>; Tue, 10 Jun 2025 10:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552020; cv=none; b=ZJeE5nphaftBJbsflET3DCgZetBDfGytxNdtjR+cyHQMZPeR01btAu9wNHm5HH51TXvGukBEe1bL9dPjX2UN3eS0v53CrpgFM9YE1P6uhlhV4HmEkLSeWUtd7LOc6fiepSad/MrdSS70o4hAZGnqsO+nU9X1OqQDOqLR1S7OrGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552020; c=relaxed/simple;
	bh=TGPVA33KRqiVoOFAVGbb61ZEdhBwrQnZ6iY5bKqDIL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i9jL+vm1nL9wCAqdQD4tOvYzXn1gVsONSLUu+6P4lxJMIWFECbBm974s9aYuujgv68stcph38VEI7lQc/4fx9CJvULAuuNX+4pb630El0GdbsRtLytqxe31v614HmKVA0a2nVHpCzjCFxEzPEMeyHJI2UFKz789NCtFy4mMkQK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODyHUlEF; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODyHUlEF"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-312028c644bso3936017a91.0
        for <perfbook@vger.kernel.org>; Tue, 10 Jun 2025 03:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749552018; x=1750156818; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hkn/1Usn0+x9RhPzZuArVhQQdkAHAfd1mQjhSY3gZdk=;
        b=ODyHUlEFTOAghP88Q4RqE8vl8DgGqxPW/vZVG2uq8k7dYwLRlaSKHSjJBw6xPnBM+x
         8ZctdXW+pr1EJ+JBa7nhqG7/Sv1K99Ular0GW1rVb158HvvOyAzj1eWQNw9gW6Ao/r34
         7eYDAZW87EXdhM6IK7R3VKrtTQ1/4dCaGPO4VgRan3IyjGfjiyjVkpY4movhC4hSOrIS
         yCPWnUI7T/8CGphkVSwY+eV6wnbzP/xWQsNCRMdLlnboQWKs7ufJnH1VfJkJr56VfDgk
         0h4nZ24ibZU2lie7u1HRKOay/6JFNLcihVQ+jtVy5a7rScpRR4vMX8ur5Wk3yKb0mX7i
         defw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552018; x=1750156818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hkn/1Usn0+x9RhPzZuArVhQQdkAHAfd1mQjhSY3gZdk=;
        b=tFvMuDsV0VN2uxxGJOkoc8LT4E2eRzFucL3cOvk0qYxxNC+0eGd1jA2FwutI24ML3G
         Qndpl6RXuRI1vhCQvyig7t3hOzrfd3UQAKak5VN1YASjDBrh5bhQFRvfzxyeYoD2YzL9
         FggmTlzJY3+bhOv2PBWH9NnJy9GnjKGI256z/6uSjZ1oVek2bzC5l94JjJhOkgxFCxwR
         dnAl1pKstVKbEZHVBxzY7fFddMbotbTo219RaSEMwch+2EnumYakC9xCsQlgFEWP4LLy
         iQ6X4bT5khIIs/6bKkjkJ6lfS3aFGpuH8wjXliqvfp8Mxq9avGFjp1y1qiGpAUwET3Dm
         9Wrw==
X-Gm-Message-State: AOJu0YxBtrUnd3hA5N1JK/8cKPmcduakFuXSR3XNlFRYKEnngvQb2Rgf
	EubN3e+ADjk3pIzyVbEy8KAX2VLiM4EiI/IyBo0zvGhVEMQ/RdAiH1d8
X-Gm-Gg: ASbGncuFlIqIX7IXNvH6Nr6rbXMZiFwXqe1ID7KRSYUMBQOuJJG0Not+tPn/GgU6DWr
	Tco106r52N3ccB4NP9wZ6fIWb7LwYEfHE/DqWTviUgOjxCbBs3yl1o0kEQALP5dBlQm3JxtloSz
	cwevLoa976wo8MZKzGPeyLGuDRAkehhEc464qoMEN1HLbwAoVEk3Dc9ZLPYitBg7VXJYrX6Yban
	CNjYX+j0nA5Xfhbgzaw0m+FEJd20vpr/NxD9wJNpZAXsopGW4jQuTmAG+aILfAngoGrcFyjGpQT
	vZd30j7IxuI1kS0L5LK9HReXB2Rbzk32FrCx61xlyu0AoqkgoicuoGOqrx54CX1Tyzks8Z2Jy1m
	afyxJ32ymgrc9wvTno3lb9VfZXc9alXi2
X-Google-Smtp-Source: AGHT+IHKqZO8CuXDwPvLnSsiw+7uyxcBvyToGmUgoUetRY9Ye5Hm2yjOrZpLoHQ4jMVHe9jE+5SJpQ==
X-Received: by 2002:a17:90b:2748:b0:312:1dc9:9f64 with SMTP id 98e67ed59e1d1-31347696eeamr22473450a91.31.1749552017864;
        Tue, 10 Jun 2025 03:40:17 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349ff7e14sm7807495a91.45.2025.06.10.03.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 03:40:17 -0700 (PDT)
Message-ID: <55cb3ebc-7695-4fd9-b554-97a52672fac4@gmail.com>
Date: Tue, 10 Jun 2025 19:40:15 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 3/5] docker/Dockerfile.fedora: Add gawk in package
 list
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <2a03c9df-bdef-4895-9459-477e9451d3b2@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <2a03c9df-bdef-4895-9459-477e9451d3b2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Fedora base container images stopped providing the awk command due to
the change in krb5-libs dependency [1].

perfbook's Makefile uses awk in checking rsvg-convert version.
Without awk, rsvg-convert is not used as a preferred converter.

Add gawk in the list of packages to be installed.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Link: https://github.com/fedora-cloud/docker-brew-fedora/issues/119 [1]
---
 docker/Dockerfile.fedora | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docker/Dockerfile.fedora b/docker/Dockerfile.fedora
index cb652680..c73b9c69 100644
--- a/docker/Dockerfile.fedora
+++ b/docker/Dockerfile.fedora
@@ -5,7 +5,7 @@ ARG rel=latest
 FROM fedora:$rel
 
 RUN dnf -y update && dnf install -y --setopt=tsflags=nodocs \
-    fig2ps graphviz inkscape make git vim nano gnuplot-minimal groff time \
+    fig2ps graphviz inkscape make git vim nano gawk gnuplot-minimal groff time \
     liberation-fonts dejavu-fonts-all poppler-utils librsvg2-tools \
     texlive-collection-plaingeneric texlive-collection-binextra \
     texlive-collection-latexextra texlive-epstopdf texlive-fontools \
-- 
2.43.0


