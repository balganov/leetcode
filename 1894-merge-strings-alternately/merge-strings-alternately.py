class Solution(object):
    def mergeAlternately(self, word1, word2):
        self.word1 = word1
        self.word2 = word2

        output = ''
        max = 0

        if len(self.word2) > len(self.word1):
            max = len(self.word2)
            self.word1 = self.word1 + (' '*(max-len(self.word1)))
        elif len(self.word1) > len(self.word2):
            max = len(self.word1)
            self.word2 = self.word2 + (' '*(max-len(self.word2)))
        else:
            max = len(self.word2)
        
        for i in range(max):
            output += self.word1[i]
            output += self.word2[i]
            
        return output.replace(' ','')