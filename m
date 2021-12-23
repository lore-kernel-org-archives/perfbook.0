Return-Path: <SRS0=zdsR=RI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=a062dyLR63R3YoQ88yEYcwORNX0brZiBaFOEj4gveuo=;
        b=M4FbQm+k9nnHuHo8GsiRSHkbkWSi4LA99/d9l9LBE98A/povP14y6rnYgVrDJhQksg
         tIaPuG8Jc6VH8led5e+GeplVp4xpYbQ1VTvOlGLQm46dJYYVzsFEoA49Q34sLWsB/i6Y
         jyuNhkNrRtXnV+WSe1FlKFzAib9d2TeUs0ZHNJYDzeraH03QIFbam0Rksu4Y4pb4gKRV
         GjhWikxqjW8atNDQUG4uabbnOpqtcWaZs9QeNh2hoo7LNGSP39FhtPqoUXgJ32Q7LPLH
         d6XKXZBIs8nmWiCm5jw6mZDXsqcykXIUy0yMgHXFCycmK9t1nP0YYQwXlDqyJqcczTzu
         3ZPA==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Suggestion to mention ebook-size build in perfbook's release announce
Message-ID: <c4a528a3-6c90-dc73-4870-5bb1c5918355@gmail.com>
Date: Thu, 23 Dec 2021 23:31:46 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul

In https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html,

There is a sentence "All attempts to generate epub formats for small-format
ebook readers have produced horrible results, but if you know of something
that works, please don't keep it a secret!".

Now that "make eb" and its variants can generate PDF for ebook readers
(C6 paper), it might better to update this.

C6: 114mm x 162mm (4.49in x 6.38in)
