Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1834115539A
	for <perfbook@vger.kernel.org>; Mon, 11 Nov 2024 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731326720; cv=none; b=MfvPiGDz705LaIS8SyvQj3gd5WPR7g4K1n0Xv79eh4gFrJpJct8EQBLLRum8TZoh/cprVI0YjBpvbRDVLan2Bx12gfkTjwVI8xk5eMye0lbuhQfha08s9zM2WYrDrbPZys8Kmnhp/XQL6YcDBliw04XQ2+dYqEA7L4knEt666QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731326720; c=relaxed/simple;
	bh=Nx6MvQX6n1EkcH0bgFGsoXSDDFrQgLf0FBunFf8RghE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsuiLTwdLLcCPCOQeFWqMvATM6aWtxb9gEOKIbZ7GkRDrP2uu+r/i9usL3/YgJXktdINBMIUxk8bOzJ6DeQvuCwTbKmbF6EH59p4ZocuidfcgAcvJXWko3o7pjXWy1Uxt5QtCLQTU+SMTKDbLEuNqjs/SL1z8UHv1AJv7DLlrCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAWmuzDs; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAWmuzDs"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e2e2e50a796so604818276.0
        for <perfbook@vger.kernel.org>; Mon, 11 Nov 2024 04:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731326716; x=1731931516; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nx6MvQX6n1EkcH0bgFGsoXSDDFrQgLf0FBunFf8RghE=;
        b=MAWmuzDsSuGClAv+A55jm2HcJBf3jU4JUDt/McXgIem4ms0yZ+M813qzkl1m3lmiLR
         /YVzVXwPKVFWKSzfZeFuzWEorbG4/rnEH1N8E+HhijlrQJfkeLv34OGlpwznguZXqfpL
         WB9typIw6goM80T8+MnTw+Wo5cwRC0Wb5FlTUJhwJKDlJvJNQYVT7NAnkag1EWgy9vBk
         2R93DgWLh7Ti+aCc0hkYEJc/8T9uZ0GdUKKWZ85z5ZS03jJb77qV/QLS+87vs0KDaXLB
         P83fL3N7WQiR6vwQwrFZMslvlEUlsAo+7iqgp3vbajzHqv3TpIY7x50CGNm8AE5MUAtB
         xknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731326716; x=1731931516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nx6MvQX6n1EkcH0bgFGsoXSDDFrQgLf0FBunFf8RghE=;
        b=o0Bpd+TggIfTudb4LR8NW/rs8fFftNt8+bUkgpiaFBSKUXoZBxHmJ24OJZdZzP+Z9Q
         1Quh/i4zFTfJCyhd4Pfpo+RRUITrlfYwmaaJpBCw59dEqixEgbnz5UzLM1qG03jpl/Ux
         lVFpVwfT8liZlcgRFQUIbZq/j4sGnqRt9pAevinF3ArCM3028sTpMDT6GbQe+XLLjQe2
         hPVNDAxWMvL9YNeKy9t7+ocIYrN7EZ3PFbmLyTF8DlLM4LQDZi8xOToQnpB2JFYjMsDv
         ol5tstcYN3R+G6uZPcmTKlDEWsca6+kuTpT0hxH/TzZFkjGmrBOi3dbC3Eu6Sw7JILHL
         kNWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwFy214lYqFFOv3Vl0OSKjWAC/jimQNlUKsJ3dOs5Rm/A9GxjLLqjXfCb/aJ/cRLJNfTN3vF0KTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp7VQwKJL5GFxDxMlmHq8PFIYawD6yhAv6gf0QyvqzN9NERNkD
	YHH2ZzlYhXVd8qUJ1XsW+im2Zg4H2Nc4+VYl1QaWV7aGKo5ayXkySK8R4tMhp7cFnWVsqvUutLE
	OVeSePDm7V30ZfnldTNJfwPDgmmc=
X-Google-Smtp-Source: AGHT+IHw9UAKHTp1ZAkwL0d5qljZz6IM27pj/UTedDWfTPnjLjHKTv89YCa53LJ4myPyrpXZuk1Fb5JoE6S0vfvH8EU=
X-Received: by 2002:a05:690c:7345:b0:6c8:7827:f289 with SMTP id
 00721157ae682-6eaddf7c494mr44327267b3.5.1731326715832; Mon, 11 Nov 2024
 04:05:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+MhoaPy0Rf3V4A4B8DNneZmNdF2heJn4YaoTXeDAD8880veKg@mail.gmail.com>
 <317b9b3f-9dc9-4a5f-9d47-8d5b9d32b55e@gmail.com> <CA+MhoaM4O-WFsc7pDBHiPoin0dqt0ZDLrZRq-SQ4z=i_T_5r+g@mail.gmail.com>
 <7C3222F1-80F2-4EA5-AB70-F9922DBE4210@gmail.com>
In-Reply-To: <7C3222F1-80F2-4EA5-AB70-F9922DBE4210@gmail.com>
From: Elad Lahav <e2lahav@gmail.com>
Date: Mon, 11 Nov 2024 07:04:52 -0500
Message-ID: <CAJbg=FVpjoBHHHTaYewTn-k-Dfa9LqmyZ2vPT7+b2Ep6Xi0xbg@mail.gmail.com>
Subject: Re: A question about "4.3.4.2 A Volatile Solution" of perfbook
To: Alan Huang <mmpgouride@gmail.com>
Cc: Nan Xiao <xiaonan830818@gmail.com>, Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Machine-sized means smaller than or equal to sizeof(long).
>
> Take a look at the implementation of WRITE_ONCE or READ_ONCE of linux.

That is not necessarily true. What sizes and alignments are guaranteed
to be atomic for access (i.e., writing a value to a memory location
results in everyone seeing either the old value or the new value,
never a mix) is defined by the hardware architecture, and need not
align with the C definition of long. You can use the C11
ATOMIC_*_LOCK_FREE() to determine if a type is atomic.

As Akira points out, the term "atomic" is overloaded, and can cause
much confusion. A type being atomic for read or write access does not
imply atomic read-modify-write.

--Elad
