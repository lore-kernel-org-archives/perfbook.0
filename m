Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60EB184F
	for <perfbook@vger.kernel.org>; Sun,  5 Jan 2025 11:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736075285; cv=none; b=liu09bpqn0O88cmpI9rel341bGIyJh0j/aUP51u06f6xHI4MyoUkrEHWUNot7cIH7JoL7rNP+xHrCvNJqx8YBVoUIAWClXWcGczbJvs7MO8EkQFP1RtGLawLJQ6qgxsj4ygpR28NYSW8yZF3P9lfo65E4r32wFJFqQloFaUkIWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736075285; c=relaxed/simple;
	bh=QY1VsVSunuKI2h9tBzyMBSSzACmmYVV8tIJNJFD0xYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gKCkt/AABb13k8Ei1jZ1+8gmVzoVTBBc3atTj8lXyiCLiFKfXq3ipKY6OEBm5CpkTnWKsJU8D+J4w5CImZdzku9HgWU/fb7cfHbB35NoZHmL/haD00Be+5fxu8U3HtMzM73IIte9XtRZDOAkam96z9EQunL61wARl712+m+2xnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWu8a+o/; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWu8a+o/"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21661be2c2dso173697985ad.1
        for <perfbook@vger.kernel.org>; Sun, 05 Jan 2025 03:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736075283; x=1736680083; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6xdys2k0hZ6Hv391YL5U8kZ+rfXko6wxRwGv5MkuAuY=;
        b=IWu8a+o/eQ+CtmvuBU+PGFpsjMhg5uOD+y/jzZAmik9CSwzLWIbRLYKOvaytgs239D
         23h5FsMUGD8qLQprbC5sXQe6Hh2qJlqr7JAz6Ev3wcH9ceQxki7+3FoENKjtco+Y3woT
         FEKAwk/PPzQJFHxnXKXL20YGokJw4DvK6s+wmYdHqpuq2h+JwVWhUjhgduEBJIGVXtPr
         v/lmWwYphHUmz2PF3QOLZ8nb1Bd8lp0j97JuJAuv4YeT2kJH4vew1pIxqvz0jvz01vBi
         E7OaStRVYkCnoTF2tpEqELg6ayxlf3QxqpiN3dADWKm3WDcHvJbdKikB0pFaKDyLke99
         xx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736075283; x=1736680083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6xdys2k0hZ6Hv391YL5U8kZ+rfXko6wxRwGv5MkuAuY=;
        b=ffxaJmBeCz0Dx5LL6fECnac05OIOOgnqfnytYUyOAeFdoZhYsSVJKKW+IvqFkoh33m
         O7B5fQaz3jjD3zFpzPmdwSwmEtTIUQQjSaS7RkshH65/nlQyeL+i92bhs+wTkytOfHON
         AFQ0EkQDzrR8kZh7c3Xt/SD6D9Mnvw1LHRUuc1NL2rlKKESiFwS/YOvuiXzWdQPBSucn
         6xJXXDsgE4TFJLpDdOsp060WflJNlJu0WEaY/wcqa9KpPWch0YsJ1CNpojxN9Q8MFrI/
         Tzv2Oss7TFYxrCRoT4E2zHQOnzIKAD7ZQZMEkyPXMADBWVUuWCAydRLTUgXxdAQGCGDG
         9S8g==
X-Gm-Message-State: AOJu0YzGiJU+GcGPw5CMe7lcn3s91uij0ceujVcXvaKexL8w8HDqD8ig
	rLYxNWuwe/i+qvMpd7vUF2mZ1g3ZC4fhHHjUlz8Uai6zbSWeovxZ658/pw==
X-Gm-Gg: ASbGnctGZcgHWZIk6mvqozfXG9IXEBAFL5W9tUQNn0kRnE2iXOR8m5PU0V1CuTTYreH
	iVdPflN5blRglhJ+Th/eue44RHZtPl6cMRBacqI33iFgRZg4OCnKPjw/HxZFkFN/PvUOVtQ0MdD
	hh2xr9vEUldl86NPnFKbhDwgI+w9voW9gdvlLz/RGgEz5N6PgMr/mbEHJvy23lSKh3C0gCBF+Wv
	khXP3b8/azmvKzDuGtXOWMo7Rf8aUEmg1MGWi7edoDjw3CJqxCDFHeQUzAkQ9TeHiaBoRWEXU/B
	S1BChBltPctxVDzjYa+oTMk=
X-Google-Smtp-Source: AGHT+IGlpoM6qxiL1ehDkUpIpK7DKPMrcpK3xVE1a14WjJGZUhnb5J0FJyzfbZIcT6UAOovGcPMJPA==
X-Received: by 2002:a05:6a20:6a06:b0:1e0:d104:4dbd with SMTP id adf61e73a8af0-1e5e085828cmr101562353637.46.1736075282927;
        Sun, 05 Jan 2025 03:08:02 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad81641esm29312421b3a.3.2025.01.05.03.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 03:08:02 -0800 (PST)
Message-ID: <8bcb9bed-02a7-46bf-83c3-8e427b8ea9dd@gmail.com>
Date: Sun, 5 Jan 2025 20:08:02 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH -perfbook 1/6] CodeSamples: Put $(GCC_ARGS) in cc argument
 list
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <bf045b9a-4a09-4c84-9df8-4ec7154144c7@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <bf045b9a-4a09-4c84-9df8-4ec7154144c7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

There are a couple of Makefiles who don't have $(GCC_ARGS) in cc command
lines.  If you say:  

    make GCC_ARGS="-g -Wall -O0"

, the arguments are simply ignored by them.

Fill it in for ease of experiments/testing of compiler flags.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/intro/Makefile   | 12 ++++++------
 CodeSamples/locking/Makefile |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/CodeSamples/intro/Makefile b/CodeSamples/intro/Makefile
index c7be0cb3..a6ca32d8 100644
--- a/CodeSamples/intro/Makefile
+++ b/CodeSamples/intro/Makefile
@@ -15,22 +15,22 @@ endif
 include $(top)/recipes.mk
 
 initrace: initrace.c ../api.h
-	cc -g -Wall -o initrace initrace.c -lpthread
+	cc -g -Wall $(GCC_ARGS) -o initrace initrace.c -lpthread
 
 initraceperf: initraceperf.c ../api.h
-	cc -g -Wall -o initraceperf initraceperf.c -lpthread
+	cc -g -Wall $(GCC_ARGS) -o initraceperf initraceperf.c -lpthread
 
 lockinc: lockinc.c ../api.h
-	cc -g -Wall -o lockinc lockinc.c -lpthread
+	cc -g -Wall $(GCC_ARGS) -o lockinc lockinc.c -lpthread
 
 nakedinc: nakedinc.c ../api.h
-	cc -g -Wall -o nakedinc nakedinc.c -lpthread
+	cc -g -Wall $(GCC_ARGS) -o nakedinc nakedinc.c -lpthread
 
 perthreadinc: perthreadinc.c ../api.h
-	cc -g -Wall -o perthreadinc perthreadinc.c -lpthread
+	cc -g -Wall $(GCC_ARGS) -o perthreadinc perthreadinc.c -lpthread
 
 threadcreate: threadcreate.c ../api.h
-	cc -g -Wall -o threadcreate threadcreate.c -lpthread
+	cc -g -Wall $(GCC_ARGS) -o threadcreate threadcreate.c -lpthread
 
 clean:
 	rm -f $(PROGS)
diff --git a/CodeSamples/locking/Makefile b/CodeSamples/locking/Makefile
index cf600636..8f6a382a 100644
--- a/CodeSamples/locking/Makefile
+++ b/CodeSamples/locking/Makefile
@@ -15,13 +15,13 @@ endif
 include $(top)/recipes.mk
 
 locked_list: locked_list.c ../api.h
-	cc -g -Wall -o locked_list locked_list.c
+	cc -g -Wall $(GCC_ARGS) -o locked_list locked_list.c
 
 xchglock: xchglock.c ../api.h
-	cc -g -Wall -o xchglock xchglock.c -lpthread
+	cc -g -Wall $(GCC_ARGS) -o xchglock xchglock.c -lpthread
 
 rec_tree_itr: rec_tree_itr.c ../api.h
-	cc -g -Wall -o rec_tree_itr rec_tree_itr.c -lpthread
+	cc -g -Wall $(GCC_ARGS) -o rec_tree_itr rec_tree_itr.c -lpthread
 
 clean:
 	rm -f $(PROGS)
-- 
2.34.1


