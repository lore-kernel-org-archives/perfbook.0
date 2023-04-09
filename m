Return-Path: <SRS0=hRMX=AA=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680999122; x=1683591122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o0mPKk4iLNTwAUCxyHC6JzNwDYmX5cEq3qSxFvsLx9g=;
        b=D7Ej+DjVdI1Kp1P4JcwSBlI7bNd464Pm9BV3s9zTt5VrbpmLtHY+B6vDiBa0rGeHAK
         9iAwI/zgSOFHpnRrJDRnJHngWkm1E/4g0CBnQPj8sfX9d4+nKhaPjHd1Olz9NI+nWPo2
         BbvYo3HmVplr0aqSEYtmIZHdZMsw4j1WacjXr2hB52JVHINIsL2Vz82rRc+hNyo9d/BU
         fMMocL/wws1U4nycqsLVv9QNLDzZR8A6nD1mKHFoNtusmUL+7Nk2Vq4gaXqn1pAnK/BH
         A+eaWR1udNQuHxFqrFOCO/w8/pUFYYULgfyXQGX4ZnUewEgiiSJBZstDmJdNduEI7Mvv
         H9PA==
Message-ID: <e425c28d-c285-0fc6-b692-744df0bde3a8@gmail.com>
Date: Sun, 9 Apr 2023 09:11:58 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] CodeSamples/count: Remove unnecessary memory barriers
References: <20230407175813.1334028-1-mmpgouride@gmail.com>
 <81ADBFE2-3576-48EC-A892-B49A5C265487@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <81ADBFE2-3576-48EC-A892-B49A5C265487@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Alan Huang <mmpgouride@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi,

On Sat, 8 Apr 2023 02:04:24 +0800, Alan Huang wrote:
> Hi Paul and Akira,
>=20
> This is the patch v3, I forgot to add a version tag=E2=80=A6
>=20
> And I think it may be better to add a question in a subsequent path.

So I'm looking at Quick Quizzes on count_lim_sig.c.
It looks to me Quick Quiz 5.50 lost its context due to the
removal of smp_mb() and the use of smp_store_release().

A band-aide fix would be to change the quiz to:

    In Listing 5.18's function flush_local_count_sig(), why
    are there READ_ONCE(), WRITE_ONCE(), and smp_store_release()
    wrappers around the uses of the theft per-thread variable?

, and to adjust the line count in its Answer.

However, smp_store_release() is by no means a simple wrapper.
So I'm wondering if it is worthwhile to keep this quiz.

Paul, how about replacing the quiz with the new quiz asking:

     In Listing 5.18, doesn't flush_local_count_sig() need
     a stronger memory barrier or two?

, and picking Alan's reasoning in the answer?

        Thanks, Akira

>=20
> Thanks,
> Alan

