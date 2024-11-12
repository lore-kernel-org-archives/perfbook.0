Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB351F80CD
	for <perfbook@vger.kernel.org>; Tue, 12 Nov 2024 00:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731372487; cv=none; b=JK/y9ZM7c4ynocju3uhXUY86Y2V8OycGKN+POz1jdPjuvHtOS55bVgKdZ8l+sVapeCebc7it3yf0Jtj7AkdZpv4tlZUSVPB21OuL/FpurFK5zAzcCI7XS91+0r4zJTkL37eHdN4r0HHMnbiJRc+eX3WRDWlf4KQY6Jrmas46wSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731372487; c=relaxed/simple;
	bh=AESKqLYDV57LWzHy1YvxHplrCxQkXaBZmGc9ZgonMD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWxvobHTvCKsFKdE6py8wHAAFcjaqY90/oP1kHw27qomjjme4Z1OZOnKCHUY+RGpDnFuNwa7vKoZ+sVhpzJj4rXIkVLkv412vcIx5Qkclsnf3XFzQkmyI3fIUQit+U/ObKnAPVjJPX3wtvaF54jiJmBd/NvX/4VvmFdJQ79ffAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPGeQHzI; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPGeQHzI"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c95a962c2bso7619855a12.2
        for <perfbook@vger.kernel.org>; Mon, 11 Nov 2024 16:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731372484; x=1731977284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AESKqLYDV57LWzHy1YvxHplrCxQkXaBZmGc9ZgonMD0=;
        b=UPGeQHzIqaW8onGY9TBdVd2tzuHWPMTQ4ZdZH0SwWKkDWCTKJnqwzIMxogMFAQHHct
         7M0T8TraGh8uozx3ONf70Gxo9HdTURNaIbqRiQiPQR02+Gi6dWbLYBRApG+n0/71F1kI
         D3W44p94RGWUHc1cWzntAJmEOBLQRxxPl2hYnSKjBI0NfKwLK4YpYEl0seu2zIyEMUnZ
         tSuKjZXmPaHKURJydQCFnxji7akV1mhy87uCsOa7j/j7bJnaVsmX1+Dz6rOqyZqkLvgc
         NfcZw8fGKm2V635EMpeHztQ8lFEZ1XFpuy6XmQRPqRRjQ2JefXYpSuO6HNAoq0kHrYZl
         yTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731372484; x=1731977284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AESKqLYDV57LWzHy1YvxHplrCxQkXaBZmGc9ZgonMD0=;
        b=hpi26Yli+vvgo73SmWBq05d1rN/gfpFgqguKxJ4BdKPn8iFl2MGG5HVLnUk2xLmSbD
         GiUKSm2c++ZXF16FtXeffjRwmz5+ySy3RAQrG121qpAWQtvyLKzzL5kaC241UFbDgWSO
         cIOwTh/ua0k837+NF3EO2VtvQuHUHCQzsjyAoNYXdmAsIfTe+IOgUyYYO6AftAPO7fA9
         hbda+3YUiJSFR5yfI9B8FQ1UEfWTh3osb/VWXsXIUOfu4vMtUn+0D5eo/5kOOCiTOEBi
         +SQeLqaQshXMRv1+UYcnsMco7jjR3c9trYrbJBSuAGajt95m9IDgSFcrMTX07bf01luS
         fMvA==
X-Forwarded-Encrypted: i=1; AJvYcCVZMdmVPWFGS95hOCkrhknCodPd358yKACGq4Rvn02aN6CParC2wSMSBAxYEdlZVB9yO10xEvFsXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGBog8bo+RI1uTMEJkBeb5HiFnUn0gm4CRYL1PoSUXU496D7v2
	tP6870Mqbs/mHd0bInte8tMGV65ILf22D6mgf4H9Iu8h1imD/2ytMfouUvn8UMH5FJmj6D6/kvu
	bUac4/D0Sll4DoyS0B+AN1CKs/Enfxw==
X-Google-Smtp-Source: AGHT+IE2ykBwOR9Ci5gpX3q7CmRVPax+tOclVufmaDjNxAybe5k5LkE+Eo/JUWdPeZ18ogG9uU0YuFG5/E3HqZqXnus=
X-Received: by 2002:a05:6402:d05:b0:5cb:b65d:2b6 with SMTP id
 4fb4d7f45d1cf-5cf0a45e6abmr10581902a12.32.1731372484046; Mon, 11 Nov 2024
 16:48:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+MhoaPy0Rf3V4A4B8DNneZmNdF2heJn4YaoTXeDAD8880veKg@mail.gmail.com>
 <317b9b3f-9dc9-4a5f-9d47-8d5b9d32b55e@gmail.com> <CA+MhoaM4O-WFsc7pDBHiPoin0dqt0ZDLrZRq-SQ4z=i_T_5r+g@mail.gmail.com>
 <7C3222F1-80F2-4EA5-AB70-F9922DBE4210@gmail.com> <CAJbg=FVpjoBHHHTaYewTn-k-Dfa9LqmyZ2vPT7+b2Ep6Xi0xbg@mail.gmail.com>
In-Reply-To: <CAJbg=FVpjoBHHHTaYewTn-k-Dfa9LqmyZ2vPT7+b2Ep6Xi0xbg@mail.gmail.com>
From: Nan Xiao <xiaonan830818@gmail.com>
Date: Tue, 12 Nov 2024 08:47:52 +0800
Message-ID: <CA+MhoaMx2VjxYOSCNmxmhHQ80Fmes-MbnVTT6tGM=Zaxokpr=g@mail.gmail.com>
Subject: Re: A question about "4.3.4.2 A Volatile Solution" of perfbook
To: Elad Lahav <e2lahav@gmail.com>
Cc: Alan Huang <mmpgouride@gmail.com>, Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Elad,

Thanks very much for your time and clarification!

Best Regards
Nan Xiao

On Mon, Nov 11, 2024 at 8:05=E2=80=AFPM Elad Lahav <e2lahav@gmail.com> wrot=
e:
>
> > Machine-sized means smaller than or equal to sizeof(long).
> >
> > Take a look at the implementation of WRITE_ONCE or READ_ONCE of linux.
>
> That is not necessarily true. What sizes and alignments are guaranteed
> to be atomic for access (i.e., writing a value to a memory location
> results in everyone seeing either the old value or the new value,
> never a mix) is defined by the hardware architecture, and need not
> align with the C definition of long. You can use the C11
> ATOMIC_*_LOCK_FREE() to determine if a type is atomic.
>
> As Akira points out, the term "atomic" is overloaded, and can cause
> much confusion. A type being atomic for read or write access does not
> imply atomic read-modify-write.
>
> --Elad
