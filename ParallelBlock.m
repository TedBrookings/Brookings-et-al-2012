classdef ParallelBlock < handle
  % ParallelBlock is a simple class that provides syntactic sugar for
  %  managing calls to start and stop matlab pool
  % Create a ParallelBlock object to guarantee the matlab pool is open
  %  (if it's available). Call parBlock.endBlock() to close the pool
  %  (unless it was active before the block was constructed, or another
  %  ParallelBlock is keeping it open).
  % When the ParallelBlock object is deleted, it automatically calls
  %  endBlock(), so attaching a ParallelBlock object to another object will
  %  guarantee that the matlab pool is open for the duration of the parent
  %  objects life, and will shut it down (if it's no longer necessary) when
  %  the parent object is destroyed
  properties (SetAccess = public)
    % public properties go here
  end
  properties (SetAccess = protected)
    blocked  % boolean, true if 'matlabpool close' must be invoked at
             %   the end of the block
  end
  methods
    % constructor
    function parBlock = ParallelBlock()
      % guarantee parallel environment is active (if available)
      parBlock.blocked = false;
      parBlock.startBlock();
    end
    
    function startBlock(parBlock)
      % guarantee parallel environment is active (if available)
      if parBlock.blocked
        % already blocked, quietly return
        return
      else
        parBlock.blocked = true;
      end
      
      global numParallelBlocks
      global needStopPool
      if isempty(numParallelBlocks)
        numParallelBlocks = 0;
      end
      
      if numParallelBlocks == 0
        if ParallelIsActive()
          needStopPool = false;
        else
          try
            matlabpool
            needStopPool = true;
          catch %#ok<CTCH>
            needStopPool = false;
          end
        end
      end
      
      numParallelBlocks = numParallelBlocks + 1;
    end
    
    function endBlock(parBlock)
      % release parallel environment is active (if no longer necessary)
      if parBlock.blocked
        parBlock.blocked = false;
      else
        % already released, quietly do nothing
        return
      end
      
      global numParallelBlocks
      global needStopPool
      
      numParallelBlocks = numParallelBlocks - 1;

      if (numParallelBlocks == 0) && needStopPool && matlabpool('size') > 0
        matlabpool close
      end
    end
  end
  
  methods (Access = protected)
    function delete(parBlock)
      parBlock.endBlock();
    end
  end
end
