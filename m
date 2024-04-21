Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AF1F4F5
	for <perfbook@vger.kernel.org>; Sun, 21 Apr 2024 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713702140; cv=none; b=QwRCSgmSjN8LdKuxC4Ms9A9h9XFfku6cu4dr2Tz8SDSdQ6GjcSylNluIVdQ0YDO78x6Ayke0kLtgVKn8Kelj4stj5UT9mJna8HETZWY3Hyv0SEl8Wj7y9CCQ7uxFB4iAoYXuOv7Tm+M9DVH8gAkd4vd9rC2IHmCWJx1mbM9zWbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713702140; c=relaxed/simple;
	bh=bjAITGpP37Mz49qzXYhTMIjheINQRdY2ocJY+OF6maw=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=lfq18BVoH8ZnEzAqJqfwmHSvhV9tL7NDmf5GwL4UPNSlZmhgZ87d6mVRTxsgSCPyn670AW/N1rieXCsoqG4amwHCKvxirOnFFHK77zUK0p90Jok9p4Gt33hWzP+kaTp7CstSXzXCSpYYRbQQzRtgAdwfXIDSUC3xMInYVC5YXn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N97fHoMx; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N97fHoMx"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1e36b7e7dd2so29910125ad.1
        for <perfbook@vger.kernel.org>; Sun, 21 Apr 2024 05:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713702138; x=1714306938; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yW2yBI6F6eC0dkJb4NracSWNg3onI035gI5nfFBudVI=;
        b=N97fHoMxBIZtRvea2XjIgo3TmZhRyIcp9lZG+lgR9VLwxwAzHBZHqERAHS6uuYlQTo
         bIiEzJ8ifxMylanXCj4ls9yAKyh4Zh934LAsv/YpjE3wrWPxdtbamoeDxWFQ0TKnZrx0
         3yD3QMSlv6ctYYXnn2qbA15ukm67PSoXY6+5OTRBBDd+HuOdvRkJthb+q5UWoQf7hg1S
         hHXuRYeKs77+npGTwdczYGelqup9EfI4tCi/7JMyAiy718U+UTa3cjSzuy4G2Yj7NbvL
         hdwCtiGDfq7TqOXA6SUzhtiSdAnJpyf+F4oWn6FmMrnGfRQ+URtdB2GPJm/0PH32Lalu
         3nHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713702138; x=1714306938;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yW2yBI6F6eC0dkJb4NracSWNg3onI035gI5nfFBudVI=;
        b=RZIg7UeF9SldakzcCE7tguxeEh+ijfjpjVV4erYAT+QbXruUJnG5y6X972hmyYXM1B
         eRNjS2Gsb7ySvkPK/QfuOomN31z+RkWrcrqYjUvcGdoOP7FO6T92VldwZm55PAoh4Ml9
         pGjjj2VkJtGI+aM3GMO69mtc4IZPBGSFL71ty2kN8JmN3/mUVGj/M8pOSaJUg5OSSCl0
         ojjv+bUHoKyawfDEqXKbZlrR37GhPM1MdPLD0qacsZPOKSyHPy0EgWW5GRySaw9cQBzj
         67ar8oL6YYwByMgh2gZ2n7/a4hgzTuSUR0aAYinCHNRSebBQxim4methgNti3tWRSAkX
         El7w==
X-Gm-Message-State: AOJu0YxFwIX2BF2zazBS3SGYMcni/RO2PWXFwE0iAvbZWSQXT1QPZ6NW
	id2XbdtyWEwLagyPizJMOC3P6mDTLTdN+MYmTwZpwF8nXvEWRH7N
X-Google-Smtp-Source: AGHT+IFdCvt+LBzYdtHA7hDzGWLDd2wIAcNVF/7pGTIZRebNxmW6X+lLJ5EEz0lOpA7lXhvU0LHHRA==
X-Received: by 2002:a17:902:6f16:b0:1dd:2eed:52a5 with SMTP id w22-20020a1709026f1600b001dd2eed52a5mr5783657plk.37.1713702138523;
        Sun, 21 Apr 2024 05:22:18 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id p16-20020a170902e75000b001d8edfec673sm6232510plf.214.2024.04.21.05.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 05:22:18 -0700 (PDT)
Message-ID: <4f7ecd8d-4e8c-41a2-a948-a6d3f05843ff@gmail.com>
Date: Sun, 21 Apr 2024 21:22:16 +0900
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
Subject: [PATCH -perfbook] docker: Add options to tar for normal-user mode
 behavior
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Default behavior of super-user mode tar is to keep uid/gid and
permissions in extracting files/directories from archives.

It conflicts with security settings of rootless mode podman while
building container images from recent releases of ubuntu and fedora,
resulting in errors as follows:

  tar: latexpand-v1.3/tests/df-conflict/b: Cannot change mode to rwxrwxr-x: Operation not permitted
  tar: latexpand-v1.3/tests/df-conflict: Cannot change mode to rwxrwxr-x: Operation not permitted
  tar: latexpand-v1.3/tests/expected/err: Cannot change mode to rwxrwxr-x: Operation not permitted
  tar: latexpand-v1.3/tests/expected: Cannot change mode to rwxrwxr-x: Operation not permitted
  tar: latexpand-v1.3/tests: Cannot change mode to rwxrwxr-x: Operation not permitted
  tar: latexpand-v1.3: Cannot change mode to rwxrwxr-x: Operation not permitted
  tar: Exiting with failure status due to previous errors

Add --no-same-owner and --no-same-permission options to tar and make
it behave the same way as in its normal-user mode.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 docker/Dockerfile        | 2 +-
 docker/Dockerfile.fedora | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docker/Dockerfile b/docker/Dockerfile
index 66fd2b3f..c3e2a237 100644
--- a/docker/Dockerfile
+++ b/docker/Dockerfile
@@ -14,7 +14,7 @@ RUN apt-get update && apt-get install -y fig2ps inkscape xfig graphviz psutils \
 COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
 RUN fc-cache /usr/local/share/fonts/
 WORKDIR /opt
-RUN curl https://gitlab.com/latexpand/latexpand/-/archive/v1.3/latexpand-v1.3.tar.gz -o - | tar xfz - && \
+RUN curl https://gitlab.com/latexpand/latexpand/-/archive/v1.3/latexpand-v1.3.tar.gz -o - | tar --no-same-owner --no-same-permissions -xzf - && \
     sed -i -e 's/@LATEXPAND_VERSION@/v1.3/' latexpand-*/latexpand && \
     cp latexpand-*/latexpand /usr/local/bin
 ARG uid=0
diff --git a/docker/Dockerfile.fedora b/docker/Dockerfile.fedora
index 6812163a..cb652680 100644
--- a/docker/Dockerfile.fedora
+++ b/docker/Dockerfile.fedora
@@ -16,7 +16,7 @@ RUN dnf -y update && dnf install -y --setopt=tsflags=nodocs \
 COPY steel-city-comic.regular.ttf /usr/local/share/fonts/
 RUN fc-cache /usr/local/share/fonts/
 WORKDIR /opt
-RUN curl https://gitlab.com/latexpand/latexpand/-/archive/v1.3/latexpand-v1.3.tar.gz -o - | tar xfz - && \
+RUN curl https://gitlab.com/latexpand/latexpand/-/archive/v1.3/latexpand-v1.3.tar.gz -o - | tar --no-same-owner --no-same-permissions -xzf - && \
     sed -i -e 's/@LATEXPAND_VERSION@/v1.3/' latexpand-*/latexpand && \
     cp latexpand-*/latexpand /usr/local/bin
 ARG uid=0

base-commit: ac7686132a63f3d47fd18aa3f767610346ff484b
-- 
2.34.1

