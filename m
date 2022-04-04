Return-Path: <SRS0=JJuA=UO=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=Q+ST3s+7l3Bc7eY6P2zonkix01xFEKXvSphV/yPuu/Q=;
        b=aEuJ7BM4TQVWpCM7ArCOkr16rYWajE2N3xNRJgIW+G7bJqFJc6Q9Ap1qgOsG5k0KD3
         HFlYyycWcPn0aGaVx3otrgJsO/0oDZHlxSqte2dm1xHgz2K5eGzpiZ6meTH9BtzN8XeR
         nmlKvgbdYffP5AIj0qmmMMwetcZtZw6d0HoKto09p008RdAkWW3wOSom2loS7v1uWI4E
         Et7XkNSt7+ZNekbIortqo2tjU7Ps0EcwTmaizFSuu3kx4DoYFOM51vOIMLO31EW0BNSi
         JbLHOxQhDkusk3jWjssOUDKSXx+RNDfavkNRljoCfxl8H4nPzA8VZF0fbQgzKOu0Fuf+
         xAsg==
Message-ID: <d68c77bc-b10e-3e4c-5d03-0f18c65e04f5@gmail.com>
Date: Mon, 4 Apr 2022 09:17:34 +0900
MIME-Version: 1.0
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH -perfbook v2 0/3] punctcheck.pl updates
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

Trying again.

So, this series adds patterns in punctcheck.pl to detect misuses
of punctuation markers "\@.", ".\@", and its friends.

Patch 1/3 adds the new pattern.
Patch 2/3 adds hint messages to help you and other contributors
see what is wrong.  Hopefully the added messages are clear enough.
Patch 3/3 fixes existing misuses detected by the added pattern.

        Thanks, Akira
--
Akira Yokosawa (3):
  punctcheck.pl: Add pattern to catch reverse use of period markers
  punctcheck.pl: Add hints in complaint messages
  Fix period markers

 glossary.tex            |  2 +-
 memorder/memorder.tex   |  2 +-
 together/applyrcu.tex   |  2 +-
 utilities/punctcheck.pl | 15 +++++++++++++++
 4 files changed, 18 insertions(+), 3 deletions(-)


base-commit: 5f28b7cb0d4c447c9d6397770906c7cb4c96832c
-- 
2.25.1

