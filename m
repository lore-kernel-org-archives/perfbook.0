Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8676FAE
	for <perfbook@vger.kernel.org>; Sat,  3 Feb 2024 02:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706926363; cv=none; b=m34mqd5of6nq7jQarGJUINbhVpyRuxgJU3HIH1gE7ocbcaleQspixD/UzFT0JyzS/3gW2gwgzAPQzKzDYWekVfvXWfhxGte3wE+ZH6g4J5Srr5TMeX4bkIDk649yHrDy+ACNi5UnjTU0UaHtFIJOshc00WKKasOGXM0Fg7ngNQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706926363; c=relaxed/simple;
	bh=hBFZjJAYVbA0pXCC41o9mWSMWiq03kWspGO0ZE1V4AQ=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=l4mZDYqS/3bwZxnEFyHNR8Bgibw4l9EVYmdQnSYmmeK8A9jl6/Cjd50KGwtAk8D3lUbdBlQCaTN5n0BeLYY0MCG5iZmY+Zh+X2HpQJQevN42AyS1rJtOoQ0PgU4vj4GMPw4Z9Z8qV1gebl3/kFZjsb47R9k0EXY7G5CUvV0OM08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXIsdpDq; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXIsdpDq"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6da9c834646so2037500b3a.3
        for <perfbook@vger.kernel.org>; Fri, 02 Feb 2024 18:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706926361; x=1707531161; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/o9NuSr5XQkjAk3BrUHDI4akCRkdLAjZ8M5WK6toI8=;
        b=lXIsdpDqOzPeyW6rTtLy0lqZNtaMVtdKgstHCWw4sbLLlxojPEa0yT66btepDgymx/
         se1rsfBfZrHUSGv2aUlX549lfk7MFw+ngBbaF66pDZn7V6dpX4eyZvDojx1EisGIAjTn
         3PqpzD0h0eiqDIiMipsmL5dW7ugV37AerXL35JKlrEVJVLYh3+VwSL8u95pbffMJWo+9
         Z7eFpbXBlcFvpYpOlEjrVkisqny35+/XIJ9w44q2FnDZmn6OgogqlCNekfqpedjCqHBh
         e0aCC9qHGjYwDcJok6tmcmiRTECsFToci6d1jDnxTmVTSxqbKMzQs1JaPx/ti9fy8J/I
         ItSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706926361; x=1707531161;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7/o9NuSr5XQkjAk3BrUHDI4akCRkdLAjZ8M5WK6toI8=;
        b=Qt/Z4DT7UD00bVYDBq8wlYSeMZaOxUunepZ1pENc29YeoeGQUE4uLyko61pdkEIdP5
         Jo0pzTSZCzT04yWGZCF3ClAGWKfmncn3PtACCVBixeYUXx2t5zEO8ejZYGei3aMJEtRs
         zV/CkbsA/N7PlrlTUi1MEu95MBPl4jHkLiHsD4JM0NbgSMmd7bqkFjbcGB0X5o+PVmiO
         TbV0eWyqO9nFTQDPNVmIuZc6a0PNgZCuJI96VDkC1mlr+NyvofIap9+4kH29VD5BOJki
         SSPUvisHkfd0O4wTZJfqsSU63VwYa6tNMmnW/jN6JRmglmclGhvu6kJka4iBZqW8ZWP0
         bOvw==
X-Gm-Message-State: AOJu0YykNotkVN8TQ8CzFxjWZolQTULatEkRgbA58sD91Vqvps1LUW9q
	8cPKNIPg65nseiH6OK1vRwU+ZQmqnplNAFdU+RKaAaUs+9Leo4RS
X-Google-Smtp-Source: AGHT+IHNy+I512EkzZtDFHNQLv9vMLpd5OD48O455t9L01d+HXkLY9RFno6KJrti+2W0otautQ4Xnw==
X-Received: by 2002:a05:6a00:3217:b0:6db:ad5c:80b8 with SMTP id bm23-20020a056a00321700b006dbad5c80b8mr3972054pfb.7.1706926361268;
        Fri, 02 Feb 2024 18:12:41 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUn89GVs+rnHRiIqApDzbA6Kjq7EBFdyb/Q70d5wpakyLGNqhZiCPy9iAsCwe4/C/qIOUtCotn7fEdHySiHxW3P
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id c14-20020a056a00008e00b006dff5689e0fsm2288838pfj.111.2024.02.02.18.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Feb 2024 18:12:40 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------sjgxCOFimnr8pty1oj6pz92H"
Message-ID: <6159c720-0a7b-4670-895d-27282486148e@gmail.com>
Date: Sat, 3 Feb 2024 11:12:39 +0900
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH -perfbook 0/2] Retouch plots in QQA 15.31
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <903d71c1-b92c-49a9-8365-a931fcaf2514@gmail.com>
 <94eba816-c48f-4d48-9b33-1ee978b33bdc@paulmck-laptop>
 <b38a195a-1f23-421c-89cb-f79472458599@paulmck-laptop>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <b38a195a-1f23-421c-89cb-f79472458599@paulmck-laptop>

This is a multi-part message in MIME format.
--------------sjgxCOFimnr8pty1oj6pz92H
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/01/31 5:20, Paul E. McKenney wrote:
[...]
> 
> Except that github choked on the 366MB coe.out file.  The gzip command
> compresses it to 72MB, and "tar -cJf" gets it down to 33MB, so maybe I
> rebase the compressed version into the commit that created that file.

Quote from github's file size limit at:
    https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-large-files-on-github#file-size-limits

    GitHub limits the size of files allowed in repositories. If you
    attempt to add or update a file that is larger than 50 MiB, you
    will receive a warning from Git. The changes will still
    successfully push to your repository, but you can consider removing
    the commit to minimize performance impact. For more information,
    see "Removing files from a repository's history."

    ...

    GitHub blocks files larger than 100 MiB.

You hit the github's limit.

> 
> And change the script that collects the data to do the compression.  ;-)
> 
> Now kernel.org had no problem with the full file, but it might also
> be good to avoid imposing too much on their storage-space largesse...
> 
> Other thoughts?

Well, no.  Using xz compression looks reasonable to me.

By the way, you added the following in the answer to QQA 15.31:

    Alert readers may have noticed that the distribution shown in
    Figure E.10 is monomodal, which those in Figure E.12 and
    Figure E.14 are trimodal.

In coe.png, whose bin_width is 2 I think, I see a spike around
time period = [38, 40].  Count of time period 40 is 140 and the
largest count in coe.dat.

Attached coe.png is the histogram version of the same plot.
The spike is more evident there.

This spike causes slight but significant enough bump in the
right shoulder of Figure E.10 whose bin_width is 40.
You can still say the distribution is monomodal, but I just
wanted to make sure.

Or I can replace the EPS plot with the one with bin_width=2,
if you prefer.

        Thanks, Akira
--------------sjgxCOFimnr8pty1oj6pz92H
Content-Type: image/png; name="coe-hist.png"
Content-Disposition: attachment; filename="coe-hist.png"
Content-Transfer-Encoding: base64

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

--------------sjgxCOFimnr8pty1oj6pz92H--
