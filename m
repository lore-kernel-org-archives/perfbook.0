Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=WB8E7osniRsWb6ovoN0nEi2ZSLnIy0yBiEWffaLrgG0=;
        b=OvigI/iWcaBfYFQTzZBGUpWPS+a5jNOCjb6gI/BpAJxwnbVOmm+tlvEz62gZ2cFEPg
         yNpz9tNqWcYb6cuI5FIEVRgPvO9arpxu+TMJeXBnmUzmVopQ9nqb0ZjNB7cahszqHVpP
         /vK7oug/dDEF/dqRGKQcjxz88M9i8NB06vIyY/Zx3d7tAZ8xalwNLYF8tkqrgWGwxCXg
         Z2altcVrCDYcGMVlIlJm5H64hEM1VKB6Yd5HvswH+amFHi1zUruF4XQ4nWxNdYzHgSBN
         py/grshMV9L6PkrP1MEmxPjVzYio1i+h6eunvWxvXGRBo0XujTZrmQMeHd+CA+FJISpV
         Nh6A==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: On recent update in defer/rcuintro
Message-ID: <b9b585b4-5822-9cc3-2662-eece0dfd113c@gmail.com>
Date: Sat, 20 Apr 2019 00:27:23 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

You might have already noticed, but your fix of Figure 9.7 has 
made Quick Quiz 9.20 pointless. And there remains another use of
WRITE_ONCE() in Figure 9.8 and its discussion in the text.

        Thanks, Akira

