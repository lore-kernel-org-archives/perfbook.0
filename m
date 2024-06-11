Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD0F16F8F0
	for <perfbook@vger.kernel.org>; Tue, 11 Jun 2024 09:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718098160; cv=none; b=pR5pGKlwrekXw/7GVMni/WnEUZGLUlahJBPnGmX1dPnG3ZRlps4/ij+x4NJgRFBop55IVBlG60URuOKwqyy8JHofuQa6+IhRCrModxVjl6Yij06MFbsZZqJlgKNqQGKacjmNNCE23CTxWInZsRFY1akPOyyAwJN169xwumLdohQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718098160; c=relaxed/simple;
	bh=BIlMda6AIdRWtmOXyZo8CTU7gMkDsfIqbx55recyNJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aD5pFmrmdFWhew9Yw2yWORS8Slloh+8RjeLcuUts/8iU9fbBAY0c2nz1IAfUjIJaWuMW212MW7w2+YII/zOBsDiHGUFUkAn2diXIXDvmubBOT1NmGlzjVT32virLVjK0wv6Rnf9JnP5J5zDSdivwM8f9yTZr9TEvO5CLp54aICA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dp1kmLJq; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dp1kmLJq"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f7274a453bso7098635ad.2
        for <perfbook@vger.kernel.org>; Tue, 11 Jun 2024 02:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718098158; x=1718702958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drTBpYweUx++ugWr8b1GJ00W+mi6BAHe0AX/ghzHC2E=;
        b=dp1kmLJqUfTcybZbDAwSd+D1dOE7YGYaWpxy5SjhvwL7Ib0gNCLJoU7XCadXMBLUdc
         mFWxVu3/U2dhMCAcUny7BFOVihMqoxRytlNa8dZm3e0ATbesdGwNDy7voeXwIoYCHHjd
         P/hyfBb3DkaQiutMqGv2Rh4sk2UcGVBw0CTUJYYtySD4pbuwacT6bCPHUWBAkKETaaBN
         V5RdVdKIB5D9VVkP1YyYj/XhUcYiJ1Zc4id6Diyrf9zJ9Wo7XwSU49kK51Wu5uWMFHos
         p4MDI+Ab9uRA+krGTsk9hB6lIIulJKLnSzA8nsMI7QZLYYHgkH+k6pRJi6GWEAVhBfwF
         VpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718098158; x=1718702958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=drTBpYweUx++ugWr8b1GJ00W+mi6BAHe0AX/ghzHC2E=;
        b=gdwaxS/ujMLTAyn9tzNqqr2MI0R2jPScOr+eA2ybQg/iPzB2ToMq0u6ojVUL57zbRE
         rHPwvQBxlZPP/xx92N+nQxuEYT9gy8lb8E+nBIIEYPIUvkNLwE+1NYKNb4O8OvvMQwjr
         A8CSaQXXpPXEM51Q1W7MDPvd61xVQAa1Xkp2qOi3XCOU7FfsCPpHhWrHzCCTE0JemEqB
         PCaizrL+v4I3XlN+KKsfJJzsphQ53AtaNVmjmac9Wz4IhPxcm2+eVulpEvG/mF3AGcbk
         pr5RyMJeLZbKMVs+gMZjGQyTFsGQ8hFt7p934OHhEqwqs/H8kcGpgdNZxmjirxdfTQGN
         1+Jw==
X-Gm-Message-State: AOJu0YybyvX6hx8QPAwJsD5kJS8lh0pkad0JnedmeJR+XfuIRz3Rw5MX
	R8hNZgocS3XQSXRgDevSR9YnFV6F7z/7/X6fc+ke2f44GXDcPeTxaLg6bw==
X-Google-Smtp-Source: AGHT+IFCh5i7NTEliMCtmpUCyuevCI+gCBJhD268RV4f0NI1CuEvXqZhJI7xel7TH7H6TOpb5ZgDqQ==
X-Received: by 2002:a17:903:24f:b0:1f7:ace:448c with SMTP id d9443c01a7336-1f70ace45a7mr50935855ad.23.1718098157825;
        Tue, 11 Jun 2024 02:29:17 -0700 (PDT)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f709733ee1sm40962225ad.245.2024.06.11.02.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 02:29:17 -0700 (PDT)
Message-ID: <9f58e8a0-567f-4032-8978-d56dc920a7c3@gmail.com>
Date: Tue, 11 Jun 2024 18:29:15 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -perfbook 0/3] Work around backward incompatible changes
 in LaTeX2e 2024-06-01
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <43076436-4692-43b3-8607-5ca85a4fb84b@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <43076436-4692-43b3-8607-5ca85a4fb84b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/06/11 18:06, Akira Yokosawa wrote:
> Hi Paul,

I fat-fingered a patch for this series.
Will send v2 soon.

> 
> As I mentioned earlier [1], recent updates in core LaTeX and accompanying
> changes in the array package broke build of perfbook.
> 
> There are two modes of incompatibilities.
> 
>   1. arydshln assumes array's internal implementation of a past version of
>      array, which is no longer true with array >=v2.6.
> 
>   2. A "LaTeX Warning:" message in loading parnotes.sty.
> 
> Neither arydshln nor parnotes is actively maintained, so here are
> workarounds made in perfbook-lt.tex.
> 
> Patch 1/3 adds a rollback option to array and sticks with array v2.5 or
> earlier.
> 
> Patch 2/3 enables a silence filter for the particular warning.
> 
> Patch 3/3 is a follow up change to use date as rollback options of
> glossaries related packages.  By saying [=2022-10-01] rather than
> [=v2.07], [=v4.49], etc., it becomes obvious when those packages worked
> well with our custom code for glossaries & indexing.
> 
> [1]: https://lore.kernel.org/r/a3ff0522-fd2d-4c87-9c7b-00cbdd5f3c68@gmail.com/
> 
> Akira Yokosawa (3):
>   Work around conflict between arydshln and array v2.6
>   Silence warning msg from LaTeX while loading parnotes package
>   Use date as rollback options for glossaries related packages
> 
>  perfbook-lt.tex | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> 
> base-commit: ef80c4a3ecb96f115b27f1d60bcf7448074ea2e7
