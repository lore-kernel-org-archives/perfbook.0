Return-Path: <SRS0=yo+v=PX=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:from:subject:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=8FMr9QJIr089nLKW0zE1HkE22KdbPrCd/PeOAgFgguQ=;
        b=i3xuTCzQBHgzTzMTRdS85tC/RiZkWBJkO4W3n81+E1yy6hgvqG8edlMwP/eO6fLUKt
         AOoaoOWWXY0uvUeRFiB0C5lXvxJ6YcLQ8qqdVQQCyywAgsHD12IptCgPH9JMaPsbBN5G
         4zTG8xlXadQUrcjsOuWZ480cNKRvgIlGiUs9VhcILRvQ0RGOjaGej8kPAlcWZyEQ0PQI
         MnEVP5ikw+pTgGHvOW+/SISezxlXfRsPLT14Ac3UXNWPY4lBuCq71vjlIW2QaNc/G7IT
         iyB3y7uVCNiObVyGQn1tYt07lJZAAKqnlNIZy0BA8hJNTcEKegNXkdApHGiTgU7Uj+1i
         /SJQ==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: An issue of Inkscape on Fedora 35
Message-ID: <a91d3e7d-8c9b-095f-7e43-32f6031bb9df@gmail.com>
Date: Thu, 4 Nov 2021 10:28:57 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Fedora 35 has recently been released.
I have noticed an issue of Inkscape there and opened a bug tracker [1].

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=2018036

I'm not sure this can be resolved soon.

It's Fedora's nature that aggressively upgraded packages result in
conflicts among them...

It might be better for you to keep Fedora 34 for editing SVG figures.

        Thanks, Akira
